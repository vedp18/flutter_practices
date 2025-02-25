import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {

    final dummyList = List.generate(18, (index) => CatalogModel.items[0]);

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
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context,index) {
            return ItemWidget(
              item: dummyList[index],
            );
        },)
      ),
      drawer: MyDrawer(),
    );
  }
}
