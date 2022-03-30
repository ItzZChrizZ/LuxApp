import 'package:flutter/material.dart';
import 'package:luxapp/components/custom_input.dart';
import 'package:luxapp/components/custom_rounded.dart';
import 'package:luxapp/constants.dart';
import 'package:luxapp/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 24,
                ),
                child: const Text(
                  "Create A New Account",
                  style: Constants.boldHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              Column(
                children: [
                  CustomInput(onPressed: () {}, text: "Email..."),
                  CustomInput(onPressed: () {}, text: "Password..."),
                  CustomButtonRounded(
                    text: "Create New Account",
                    onPressed: () {},
                    outlineBtn: false,
                  ),
                ],
              ),
              CustomButtonRounded(
                text: "Back To Login",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                outlineBtn: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
