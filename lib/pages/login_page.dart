import 'package:flutter/material.dart';
import 'package:luxapp/components/custom_input.dart';
import 'package:luxapp/components/custom_rounded.dart';
import 'package:luxapp/constants.dart';
import 'package:luxapp/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  "Welcome to LuX\nLogin to Your Account",
                  style: Constants.boldHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              Column(
                children: [
                  CustomInput(
                    onPressed: () {},
                    text: "Email...",
                  ),
                  CustomInput(
                    onPressed: () {},
                    text: "Password...",
                  ),
                  CustomButtonRounded(
                    text: "Login",
                    onPressed: () {},
                    outlineBtn: false,
                  ),
                ],
              ),
              CustomButtonRounded(
                text: "Create Account ",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage()),
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
