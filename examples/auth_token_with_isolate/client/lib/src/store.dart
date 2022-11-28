import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final storeProvider = Provider<PersistentTokenStore>((ref) {
  throw UnimplementedError();
});

abstract class PersistentTokenStore implements Listenable {
  Future<void> setToken(String? token);

  String? getToken();
}

class SharedPrefsStore with ChangeNotifier implements PersistentTokenStore {
  final SharedPreferences _prefs;

  SharedPrefsStore(this._prefs);

  @override
  String? getToken() {
    return _prefs.getString('authToken');
  }

  @override
  Future<void> setToken(String? token) {
    if (token == null) {
      return _prefs.remove('authToken').then((_) => notifyListeners());
    }
    return _prefs.setString('authToken', token).then((_) => notifyListeners());
  }
}
