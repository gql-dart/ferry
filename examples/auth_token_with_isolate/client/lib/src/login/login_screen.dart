import 'package:authors_example/src/client/client.dart';
import 'package:authors_example/src/create_author/create_author_page.dart';
import 'package:authors_example/src/graphql/auth/__generated__/login.req.gql.dart';
import 'package:authors_example/src/store.dart';
import 'package:ferry/ferry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool loading = false;
  String? error;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  const Text('Please login to to create new authors'),
                  const SizedBox(height: 16),
                  TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Username',
                          hintText: 'Any username will do'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      }),
                  const SizedBox(height: 16),
                  TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Any password will do',
                      )),
                  const SizedBox(height: 16),
                  if (error != null)
                    Text(error!,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.error)),
                  Consumer(
                    builder: (context, ref, _) => ElevatedButton(
                      onPressed: () async {
                        final ok = _formKey.currentState!.validate();
                        if (ok) {
                          final client = ref.read(clientProvider);
                          setState(() {
                            loading = true;
                          });
                          final response = await client
                              .request(GLoginReq((b) => b
                                ..fetchPolicy = FetchPolicy.NoCache
                                ..vars.username = _emailController.text
                                ..vars.password = _passwordController.text))
                              .first;
                          setState(() {
                            loading = false;
                          });
                          if (response.hasErrors) {
                            debugPrint(response.graphqlErrors.toString());
                            debugPrint(response.linkException.toString());
                            setState(() {
                              error = response.graphqlErrors?.first.message ??
                                  response.linkException?.originalException
                                      .toString() ??
                                  response.linkException?.toString();
                            });
                          } else {
                            ref
                                .read(storeProvider)
                                .setToken(response.data!.login!.token);
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Login successful')));
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CreateAuthorPage()));
                          }
                        }
                      },
                      child: const Text('Login'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
