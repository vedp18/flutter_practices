import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        // elevation: 500,
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Text(
          "Hy Hello, I am Ved",
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
