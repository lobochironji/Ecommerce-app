import 'package:ecommerce_app/presentation/auth/pages/signin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordResetEmailPage extends StatelessWidget {
  const PasswordResetEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _emailSending(),
          const SizedBox(
            height: 30,
          ),
          _sentEmail(),
          const SizedBox(
            height: 30,
          ),
          _returnToLoginButton(context)
        ],
      ),
    );
  }

  Widget _emailSending() {
    return Center(
      child: Image(
        image: ResizeImage(
          AssetImage('assets/images/send-data.png'),
          width: 100,
          height: 100,
        ),
      ),
    );
  }

  Widget _sentEmail() {
    return const Center(
      child: Text('We Sent you an Email to reset your password.'),
    );
  }

  Widget _returnToLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return SignIn();
          },
        ));
      },
      child: Text(
        'Return to Login',
        style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
      ),
    );
  }
}
