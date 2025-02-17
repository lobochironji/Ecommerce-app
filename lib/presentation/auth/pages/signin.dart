import 'package:ecommerce_app/data/auth/models/user_signin_req.dart';
import 'package:ecommerce_app/data/notifier.dart';
import 'package:ecommerce_app/presentation/auth/pages/enterpassword.dart';
import 'package:ecommerce_app/presentation/auth/pages/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 90.0,
              horizontal: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _signinText(context),
                SizedBox(height: 20.0),
                _emailField(context),
                SizedBox(height: 20.0),
                _continueBtn(context),
                SizedBox(height: 20.0),
                _createAccount(context),
              ],
            ),
          ),
        ));
  }

  Widget _signinText(BuildContext context) {
    return Text('Sign in',
        style: GoogleFonts.poppins(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
        ));
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      style: GoogleFonts.outfit(
        color: isDarkModeOn.value
            ? Color.fromARGB(255, 234, 238, 250)
            : Color.fromARGB(255, 23, 23, 23),
      ),
      controller: controllerEmail,
      decoration: InputDecoration(
        filled: isDarkModeOn.value,
        fillColor: Color.fromARGB(255, 33, 33, 33),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isDarkModeOn.value
                ? Color.fromARGB(255, 122, 122, 122)
                : Color.fromARGB(255, 23, 23, 23),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 54, 98, 204),
          ),
        ),
        hintText: 'Enter Email',
        hintStyle: GoogleFonts.outfit(),
      ),
    );
  }

  Widget _continueBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return EnterPassword(
              signinReq: UserSigninReq(
                  email: controllerEmail.text,
                  password: controllerpassword.text),
            );
          },
        ));
      },
      child: Text('Continue'),
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: "Don't have an account?"),
          TextSpan(
              text: ' Create one',
              style: TextStyle(fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return SignUp();
                    },
                  ));
                })
        ],
        style: GoogleFonts.outfit(
            color: isDarkModeOn.value
                ? Color.fromARGB(255, 234, 238, 250)
                : Color.fromARGB(255, 23, 23, 23)),
      ),
    );
  }
}
