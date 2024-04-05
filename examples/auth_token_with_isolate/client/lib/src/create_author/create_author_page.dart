import 'package:authors_example/src/client/client.dart';
import 'package:authors_example/src/client/cache_handlers/update_cache_handlers.dart';
import 'package:authors_example/src/graphql/authors/__generated__/create_author.req.gql.dart';
import 'package:ferry/ferry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateAuthorPage extends StatefulWidget {
  const CreateAuthorPage({Key? key}) : super(key: key);

  @override
  State<CreateAuthorPage> createState() => _CreateAuthorPageState();
}

class _CreateAuthorPageState extends State<CreateAuthorPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool loading = false;
  String? error;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Author'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                        labelText: 'First Name', hintText: 'Enter author name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    }),
                TextFormField(
                    controller: _lastNameController,
                    decoration: const InputDecoration(
                        labelText: 'Last Name',
                        hintText: 'Enter author\'s last name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    }),
                const SizedBox(height: 16),
                if (error != null)
                  Text(error!,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.error)),
                Consumer(builder: (context, ref, _) {
                  return ElevatedButton(
                      onPressed: loading
                          ? null
                          : () async {
                              if (_formKey.currentState!.validate()) {
                                final client = ref.read(clientProvider);
                                setState(() {
                                  loading = true;
                                });
                                final response = await client
                                    .request(GCreateAuthorReq((b) => b
                                      ..fetchPolicy = FetchPolicy.NetworkOnly
                                      ..updateCacheHandlerKey =
                                          UpdateCacheHandlerKeys.createAuthor
                                      ..vars.lastName = _nameController.text
                                      ..vars.firstName =
                                          _lastNameController.text))
                                    .first;
                                setState(() {
                                  loading = false;
                                });
                                if (response.hasErrors) {
                                  debugPrint(response.graphqlErrors.toString());
                                  debugPrint(response.linkException.toString());
                                  setState(() {
                                    error =
                                        response.graphqlErrors?.first.message ??
                                            response.linkException?.toString();
                                  });
                                } else {
                                  debugPrint(
                                      response.data!.createAuthor.toString());
                                  // ignore: use_build_context_synchronously
                                  Navigator.of(context).popUntil((route) =>
                                      route != ModalRoute.of(context));
                                }
                              }
                            },
                      child: const Text('Submit'));
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
