import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/login_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/themes.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),      //* either this should be define or "/" should be define in routes property
      
      debugShowCheckedModeBanner: false,

      /// This is for selecting themeMode of app dark, light, system
      themeMode: ThemeMode.light,

      /// This is for declaring darkTheme (how dark theme will look alike)
      darkTheme: MyTheme.darkTheme(context),

      /// similarly for light theme we'll use theme property
      theme:MyTheme.lightTheme(context),

      //* we can set initialRoutes for selecting any other route as a default
      initialRoute:
          MyRoutes.homeRoute, // using this we can set any other screen as home or default or first screen of app

      /// This are routes for flow like app with multiple screens so to route the flow from any screen to other screen
      routes: {
        //* "/" --> is home route like home  **note: whenever home is define here then it should not be define at home parameter and vice versa
        // "/": (context) => HomePage(),

        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),

        /// similarly we can add other routes to other screens
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}
