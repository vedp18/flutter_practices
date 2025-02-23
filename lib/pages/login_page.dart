import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
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

                // Submit Button
                ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                     borderRadius: BorderRadius.all(Radius.circular(10)) 
                    )
                  ), 
                  onPressed: () {},
                  child: Text(
                    "Login",
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
