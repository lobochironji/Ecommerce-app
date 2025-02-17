import 'package:ecommerce_app/data/auth/models/user_creation_req.dart';
import 'package:ecommerce_app/data/notifier.dart';
// import 'package:ecommerce_app/presentation/auth/pages/enterpassword.dart';
import 'package:ecommerce_app/presentation/auth/pages/gender_age.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
   SignUp({super.key});

  @override
  State<SignUp> createState() => _SignInState();
}

class _SignInState extends State<SignUp> {
  final TextEditingController controllerFirstName = TextEditingController();
  final TextEditingController controllerLastName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _signupText(context),
                SizedBox(height: 20.0),
                _firstNameField(context),
                SizedBox(height: 20.0),
                _lastNameField(context),
                SizedBox(height: 20.0),
                _emailField(context),
                SizedBox(height: 20.0),
                _passwordField(context),
                SizedBox(height: 20.0),
                _continueBtn(),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ));
  }

  Widget _signupText(BuildContext context) {
    return Text('Create Account',
        style: GoogleFonts.poppins(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
        ));
  }

  Widget _firstNameField(BuildContext context) {
    return TextField(
      style: GoogleFonts.outfit(
        color: isDarkModeOn.value
            ? Color.fromARGB(255, 234, 238, 250)
            : Color.fromARGB(255, 23, 23, 23),
      ),
      controller: controllerFirstName,
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
        hintText: 'First Name',
        hintStyle: GoogleFonts.outfit(),
      ),
    );
  }

  Widget _lastNameField(BuildContext context) {
    return TextField(
      style: GoogleFonts.outfit(
        color: isDarkModeOn.value
            ? Color.fromARGB(255, 234, 238, 250)
            : Color.fromARGB(255, 23, 23, 23),
      ),
      controller: controllerLastName,
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
        hintText: 'Last Name',
        hintStyle: GoogleFonts.outfit(),
      ),
    );
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

  Widget _passwordField(BuildContext context) {
    return TextField(
      obscureText: isObscure,
      style: GoogleFonts.outfit(
        color: isDarkModeOn.value
            ? Color.fromARGB(255, 234, 238, 250)
            : Color.fromARGB(255, 23, 23, 23),
      ),
      controller: controllerPassword,
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
        hintText: 'Enter Password',
        hintStyle: GoogleFonts.outfit(),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isObscure = !isObscure;
            });
          },
          icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
        ),
      ),
    );
  }

  Widget _continueBtn() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return GenderAndAgeSelectionPage(
              userCreationReq: UserCreationReq(
                  firstName: controllerFirstName.text,
                  lastName: controllerLastName.text,
                  email: controllerEmail.text,
                  password: controllerPassword.text),
            );
          },
        ));
      },
      child: Text('Continue'),
    );
  }
}
