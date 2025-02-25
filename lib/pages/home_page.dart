import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';

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
      appBar: AppBar(
        /* 
        ///? this we will use something else instead of this property
        */
        // backgroundColor: Colors.white,
        // elevation: 0.0,
        title: Text("Catalog App"),
      ),
      body: Center(
        child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
            ? ListView.builder(
                itemCount: CatalogModel.items!.length,
                itemBuilder: (context, index) {
                  return ItemWidget(
                    item: CatalogModel.items![index],
                  );
                },
              )
            : Center(child: CircularProgressIndicator()),
      ),
      drawer: MyDrawer(),
    );
  }
}
