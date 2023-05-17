import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/bloc/auth_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late AuthBloc _authBloc;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      _emailController.text = value.trim();
                      return null;
                    },
                    onSaved: (value) {
                      _emailController.text = value!.trim();
                    },
                  ),
                  const SizedBox(height: 16.0),
                  Stack(
                    children: [
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          _passwordController.text = value.trim();
                          return null;
                        },
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          icon: const Icon(Icons.info_outline),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text(
                                      'Şifreniz şunları içermelidir:'),
                                  content: const Text(
                                    '- Bir büyük harf içermelidir. [A-Z]\n'
                                    '- Bir rakam içermelidir. [0-9]\n'
                                    '- Bir özel karakter içermelidir.\n'
                                    '- Bir küçük harf içermelidir. [a-z]\n'
                                    '- Ve en az 8 karakter uzunluğunda olmalıdır.',
                                  ),
                                  actions: [
                                    TextButton(
                                      child: const Text('Kapat'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is Loading) {
                        return const CircularProgressIndicator();
                      } else {
                        return ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              final email = _emailController.text;
                              final password = _passwordController.text;

                              _authBloc.add(SignUpRequested(
                                email,
                                password,
                              ));
                            }
                          },
                          child: const Text('Register'),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is Loading) {
            return Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(child: CircularProgressIndicator()),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    ]);
  }
}
