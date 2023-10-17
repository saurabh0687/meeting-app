import 'package:flutter/material.dart';
import 'package:zoom/resources/auth_methods.dart';
import 'package:zoom/widgets/custom_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods=AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Start or join a meeting",
          style:  TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Image.asset("assets/images/onboarding.jpg"),
          ),
          CustomButton(text: "Google SignIn", onPressed:()async {
            bool res=await _authMethods.signInWithGoogle(context);
            print(res);
            if(res){
              Navigator.pushNamed(context, '/home');
            }
          },)
        ],
      ),
    );
  }
}