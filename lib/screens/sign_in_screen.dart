import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../providers/auth_notifier.dart';
import '../utils/snackbar_helper.dart';
import 'sign_up_screen.dart';


class SignInScreen extends StatefulWidget {
 const SignInScreen({super.key});


 @override
 State<SignInScreen> createState() =>
     _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
 final emailController = TextEditingController();
 final passwordController = TextEditingController();

 @override
 void dispose() {
   emailController.dispose();
   passwordController.dispose();
   super.dispose();
 }

 @override
 Widget build(BuildContext context) {
   final screenWidth = MediaQuery.of(context).size.width;


   final authNotifier = context.watch<AuthNotifier>();


   return Scaffold(
     body: SafeArea(
       child: Center(
         child: SingleChildScrollView(
           padding: EdgeInsets.all(screenWidth * 0.05),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               const Text(
                 'Sign In',
                 style: TextStyle(
                   fontSize: 30,
                   fontWeight: FontWeight.bold,
                 ),
               ),


               const SizedBox(height: 20),


               TextField(
                 controller: emailController,
                 keyboardType: TextInputType.emailAddress,
                 decoration: const InputDecoration(
                   labelText: 'Email',
                   border: OutlineInputBorder(),
                 ),
               ),


               const SizedBox(height: 20),


               TextField(
                 controller: passwordController,
                 obscureText: true,
                 decoration: const InputDecoration(
                   labelText: 'Password',
                   border: OutlineInputBorder(),
                 ),
               ),


               const SizedBox(height: 20),


               ElevatedButton(
                 onPressed: authNotifier.isloading
                     ? null
                     : () async {
                   final success =
                   await context
                       .read<AuthNotifier>()
                       .signIn(
                     emailController.text.trim(),
                     passwordController.text,
                   );


                   if (!context.mounted) return;


                   if (!success) {
                     SnackBarHelper.show(
                       context,
                       'Login gagal. Periksa email dan password.',
                     );
                   }
                 },
                 child: authNotifier.isloading
                     ? const CircularProgressIndicator()
                     : const Text('Login'),
               ),


               TextButton(
                 onPressed: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (_) =>
                       const SignUpScreen(),
                     ),
                   );
                 },
                 child: const Text(
                   'Belum punya akun? Sign Up',
                 ),
               ),
             ],
           ),
         ),
       ),
     ),
   );
 }
}