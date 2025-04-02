import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/login/data/login_repository.dart';
import 'package:flutter_application_1/features/login/presentation/almost_google_button.dart';
import 'dart:developer' as dev;

class LoginScreen extends StatefulWidget {
  final LoginRepository repository;
  const LoginScreen({super.key, required this.repository});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController mailcontroller;
  late TextEditingController passwordController;
  ValueNotifier userCredential = ValueNotifier('');

  @override
  void initState() {
    mailcontroller = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    mailcontroller.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: mailcontroller,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 32),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
              AlmostGoogleButton(
              onPressed: () {
                String mail = mailcontroller.text.trim();
                String password = passwordController.text.trim();

                widget.repository.loginUser(mail, password);
              },
              child: const Text('login'),
            ),
              AlmostGoogleButton(
              onPressed: () {
                String mail = mailcontroller.text.trim();
                String password = passwordController.text.trim();

                widget.repository.signUp(mail, password);
              },
              child: const Text('SignUp'),
            ),
                TextButton(
                  onPressed: (){
                    final mail = mailcontroller.text.trim();
                    widget.repository.resetPassword(mail);
                  }, 
                  child: Text('Reset Password')),
                   AlmostGoogleButton(
              onPressed: () async {
                final credential = await widget.repository.signInWithGoogle();
                if (credential != null) {
                  dev.log(credential.user?.email ?? 'No Email');
                }
              },
              child: const Text('Login with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
