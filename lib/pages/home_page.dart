import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/color.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/home_widgets/app_header.dart';
import 'package:flutter_catalog/widgets/home_widgets/item_list.dart';

//? not using after Day 12
// import 'package:flutter_catalog/widgets/drawer.dart';
// import 'package:flutter_catalog/widgets/item_widget.dart';

//? using after Day 12
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  //* method for loading data
  loadData() async {
    await Future.delayed(Duration(milliseconds: 1500));

    final jsonData = await rootBundle.loadString("assets/files/Catalog.json");
    final catalogData = jsonDecode(jsonData);

    var productsData = catalogData["products"];

    //* this is important to understand for mapping json data (list of products) to our data formats or Data Class
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(18, (index) => CatalogModel.items[0]);

    return Scaffold(
      backgroundColor: Colors.white,
      //? safearea is useful for keeping our screen in safearea (lil bit below that top edge and lil bit above navigation buttons)
      body: SafeArea(
        child: Container(
          padding: Vx.mOnly(top: 32, left: 22, right: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppHeader(),
              if (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
                ItemList().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),

      floatingActionButton: SizedBox(
        width: 75,
        height: 75,
        child: FittedBox(
          child: FloatingActionButton(
            foregroundColor: creamColor,
            backgroundColor: darkBluishColor,
            tooltip: "Cart",
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.cartRoute);
            },
            child: Icon(Icons.shopping_cart,size: 30,),
          ),
        ),
      ),
    );
  }
}
