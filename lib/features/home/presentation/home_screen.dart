import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/login/data/login_repository.dart';
import 'package:flutter_application_1/features/login/presentation/almost_google_button.dart';

class HomeScreen extends StatelessWidget {
  final LoginRepository repository;
   const HomeScreen({super.key,required this.repository});

  @override
  Widget build(BuildContext context) {
    final user =repository.getUser();
    return Scaffold(appBar:  AppBar(title: Text('Welcome'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text("loggen in a ${user?.email}"),),
            const SizedBox(height:15),
            AlmostGoogleButton(onPressed: () => repository.logoutUser(), child: Text("logout"))
          ],
        ),
      ),
    );
  }
}