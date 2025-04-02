import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/presentation/home_screen.dart';
import 'package:flutter_application_1/features/login/data/login_repository.dart';
import 'package:flutter_application_1/features/login/presentation/login_screen.dart';

class LoginAppExample extends StatelessWidget {
   const LoginAppExample({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = LoginRepository();
    return MaterialApp(
      home: StreamBuilder(
        stream: repository.onAuthstateChanged, 
        builder: (context, snapshot) {
          print('✅ User ist eingeloggt: ${snapshot.data?.email}');
          if (snapshot.hasData) {
            return HomeScreen(repository: repository,);
          }else {
             print('🔒 Kein User eingeloggt – gehe zu LoginScreen');
            return LoginScreen(repository:repository);
          }
        },),
    );
  }
}