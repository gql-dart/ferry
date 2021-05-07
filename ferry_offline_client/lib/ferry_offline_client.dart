import 'dart:async';
import 'package:meta/meta.dart';
import 'package:ferry_exec/ferry_exec.dart';
import 'package:gql/ast.dart';
import 'package:built_value/serializer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:ferry/typed_links.dart';
export 'package:ferry_cache/ferry_cache.dart';
export 'package:gql_link/gql_link.dart';
export 'package:normalize/policies.dart';
export 'package:ferry/src/update_cache_typed_link.dart' show UpdateCacheHandler;
export 'package:ferry_exec/ferry_exec.dart';
export 'package:gql/ast.dart' show OperationType;
import 'package:ferry_hive_store/ferry_hive_store.dart';

import './src/offline_mutation_typed_link.dart';

class OfflineClientConfig {
  final LinkExceptionHandler linkExceptionHandler;

  OfflineClientConfig({
    this.linkExceptionHandler,
  });
}

class OfflineClient extends TypedLink {
  final Link link;
  final StreamController<OperationRequest> requestController;
  final Map<String, TypePolicy> typePolicies;
  final Map<String, Function> updateCacheHandlers;
  final Map<OperationType, FetchPolicy> defaultFetchPolicies;
  final bool addTypename;
  final Box storeBox;
  final Box mutationQueueBox;
  final Cache cache;
  final OfflineClientConfig offlineConfig;
  final Serializers serializers;

  TypedLink _typedLink;

  OfflineClient({
    @required this.link,
    @required this.storeBox,
    @required this.mutationQueueBox,
    @required this.serializers,
    this.offlineConfig,
    StreamController<OperationRequest> requestController,
    this.typePolicies = const {},
    this.updateCacheHandlers = const {},
    this.defaultFetchPolicies = const {},
    this.addTypename = true,
  })  : cache = Cache(
          store: HiveStore(storeBox),
          typePolicies: typePolicies,
          addTypename: addTypename,
        ),
        requestController = requestController ?? StreamController.broadcast() {
    _typedLink = TypedLink.from([
      RequestControllerTypedLink(this.requestController),
      OfflineMutationTypedLink(
        cache: cache,
        mutationQueueBox: mutationQueueBox,
        serializers: serializers,
        requestController: this.requestController,
        linkExceptionHandler: offlineConfig?.linkExceptionHandler,
      ),
      if (addTypename) AddTypenameTypedLink(),
      if (updateCacheHandlers.isNotEmpty)
        UpdateCacheTypedLink(
          cache: cache,
          updateCacheHandlers: updateCacheHandlers,
        ),
      FetchPolicyTypedLink(
        link: link,
        cache: cache,
        defaultFetchPolicies: defaultFetchPolicies,
      )
    ]);
  }

  @override
  Stream<OperationResponse<TData, TVars>> request<TData, TVars>(
    OperationRequest<TData, TVars> request, [
    forward,
  ]) =>
      _typedLink.request(request, forward);

  /// Initializes an [OfflineClient] with default hive boxes
  static Future<OfflineClient> init({
    @required Link link,
    @required Serializers serializers,
    OfflineClientConfig offlineConfig,
    StreamController<OperationRequest> requestController,
    Map<String, TypePolicy> typePolicies,
    Map<String, Function> updateCacheHandlers,
    Map<OperationType, FetchPolicy> defaultFetchPolicies,
    bool addTypename,
  }) async {
    await Hive.initFlutter();
    final storeBox = await Hive.openBox<Map<String, dynamic>>('ferry_store');
    final mutationQueueBox =
        await Hive.openBox<Map<String, dynamic>>('ferry_mutation_queue');
    return OfflineClient(
      link: link,
      storeBox: storeBox,
      mutationQueueBox: mutationQueueBox,
      serializers: serializers,
      offlineConfig: offlineConfig,
      requestController: requestController,
      typePolicies: typePolicies,
      updateCacheHandlers: updateCacheHandlers,
      defaultFetchPolicies: defaultFetchPolicies,
      addTypename: addTypename,
    );
  }
}
