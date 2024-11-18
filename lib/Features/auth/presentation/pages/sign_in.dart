import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store2/Features/auth/providers/auth_provider.dart';
import 'package:store2/Features/home/presentation/pages/home_page.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  String? email, password;

  @override
  Widget build(BuildContext context) {
    final authProvider = ref.watch(authNotifierProvider);
    ref.listen<AsyncValue>(authNotifierProvider, (_, state) {
      if (state is AsyncError) {
        showSnackBar(context);
      } else if (state is AsyncData) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const HomePage();
        }));
      }
    });
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Sign In',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  email = value;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                onChanged: (value) => password = value,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              Color.fromARGB(255, 241, 241, 241))),
                      onPressed: () {
                        ref
                            .read(authNotifierProvider.notifier)
                            .Login(email: email!, password: password!);
                      },
                      child: authProvider.when(
                        data: (data) => const Text(
                          "Sign in",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        error: (error, stackTrace) {
                          return Text(
                            "Sign in",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          );
                          //  showSnackBar(context);
                        },
                        loading: () => const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            //   value: 0.1,
                            strokeWidth: 3,
                          ),
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Email or password is incorrect'),
        action: SnackBarAction(
          label: 'ok',
          onPressed: () {},
        ),
      ),
    );
  }
}
