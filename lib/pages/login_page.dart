import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  //? creating formKey using GlobalKey (so can be access from anywhere)
  final _formKey = GlobalKey<FormState>();

  //? creating function moveToHome() for better handling
  moveToHome(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);

      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      // keeping SingleChildScrollView for small devices to avoid bottom overflow errors
      child: SingleChildScrollView(
        //? we are using Form so we get more features
        child: Form(
          key: _formKey,
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
                "Welcome $name",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.alegreya().fontFamily,
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Column(
                  children: [
                    // username
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "UserName cannot be Empty";
                        }

                        return null; // null means no error
                      },
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    // password
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannpt be Empty";
                        }
                        if (value.length < 6) {
                          return "Password must be atleast 6 characters long";
                        }

                        return null; // null means no error
                      },
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    // Submit Button
                    Material(
                      color: Colors.deepPurple,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 40 : 5),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton ? 40 : 120,
                          height: 40,
                          alignment: Alignment.center,

                          //? we will use decoration of material widget instead of AnimatedContainer
                          //? without Material widget as ancestor of InkWell that splash effect won't display well (splash occurs in background only)
                          //  decoration: BoxDecoration(
                          //   color: Colors.deepPurple,
                          //   // shape: changeButton ? BoxShape.circle : BoxShape.rectangle,
                          //   borderRadius:
                          //       BorderRadius.circular(changeButton ? 40 : 5),
                          // ),
                          child: changeButton
                              ? Icon(Icons.done_outline_sharp)
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                    ),

                    // ElevatedButton(
                    //   style: TextButton.styleFrom(
                    //     minimumSize: Size(120, 40),
                    //     backgroundColor: Colors.deepPurple,
                    //     foregroundColor: Colors.white,
                    //     shape: const RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(5)),
                    //     ),
                    //   ),
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //   },
                    //   child: Text(
                    //     "Login",
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
