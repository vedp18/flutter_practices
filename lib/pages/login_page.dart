import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      // keeping SingleChildScrollView for small devices to avoid bottom overflow errors
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Image.asset(
              "assets/images/login_image.png",
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 15,
            ),
            // Text
            Text(
              "Welcome",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.lato().fontFamily,
              ),
            ),
        
            const SizedBox(
              height: 15,
            ),
        
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Column(
                children: [
                  // username
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Enter Username", labelText: "Username"),
                  ),
        
                  const SizedBox(
                    height: 10,
                  ),
        
                  // password
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter Password", labelText: "Password"),
                  ),
        
                  const SizedBox(
                    height: 15,
                  ),
        
                  // Submit Button
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size(120, 40),
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: Text(
                      "Login",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
