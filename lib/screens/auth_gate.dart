import 'package:pertemuan6/screens/sign_in_screen.dart';
import 'package:pertemuan6/screens/todo_screen.dart';
import 'package:pertemuan6/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget{
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context){
    final auth = AuthService();

    return StreamBuilder<User?>(
      stream: auth.authStateChange,
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting){
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasError){
          return const Scaffold(
            body: Center(
              child: Text("Gagal memuat status Login"),
            )
          );
        }

        if (snapshot.hasData){
          return TodoScreen();
        }

        return const SignInScreen();
      },
    );
  }

}