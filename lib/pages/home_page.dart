import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/color.dart';
import 'package:flutter_catalog/models/catalog.dart';
// import 'package:flutter_catalog/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';

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
                CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        "Flutter Practice App"
            .text
            .xl3
            .fontFamily(GoogleFonts.cherrySwash().fontFamily as String)
            .bold
            .color(darkBluishColor)
            .make(),
      ],
    );
  }
}

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items!.length,
      itemBuilder: (context, index) {
        final item = CatalogModel.items![index];
        return CatalogItem(item: item);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item item;
  const CatalogItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          ItemImage(imageUrl: item.imageUrl),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text: Item name
                item.name.text.lg.bold.color(darkBluishColor).make(),

                // Text: Item description
                item.desc.text.textStyle(context.captionStyle).make(),

                // ButtonBar: Item prie and Buy Button
                //? ButtonBar is used for holding many buttons together
                // ignore: deprecated_member_use
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.only(
                    top: 8,
                    right: 16,
                  ),
                  children: [
                    "\$${item.price}".text.bold.make(),
                    //? In velocity_x empty SizedBox can be created like /* <height in double>.heightBox
                    SizedBox(
                      height: 34,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(darkBluishColor),
                        ),
                        child: "Buy".text.color(creamColor).make(),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ).color(creamColor).rounded.square(140).make().pSymmetric(v: 14);
  }
}

class ItemImage extends StatelessWidget {
  final String imageUrl;

  const ItemImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl)
        .box
        .rounded
        .padding(EdgeInsets.all(5))
        .color(Colors.white)
        .make()
        .p12();
  }
}
