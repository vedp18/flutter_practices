import 'package:flutter/material.dart';
import 'package:flutter_catalog/color.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemDetailPage extends StatelessWidget {
  final Item item;

  const ItemDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(item.id.toString()),
              child: Image.network(item.imageUrl),
            ).pOnly(bottom: 15, left: 20, right: 20),
            Expanded(
              child: VxArc(
                // arcType: VxArcType.convey,
                height: 20,
                edge: VxEdge.top,
                child: Container(
                  width: double.infinity,
                  color: creamColor,
                  child: Column(
                    children: [
                      item.name.text.color(darkBluishColor).bold.xl4.make(),
                      item.desc.text
                          .color(darkBluishColor)
                          .textStyle(context.captionStyle)
                          .make(),
                    ],
                  ).p24(),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(18),
        color: creamColor,
        child: OverflowBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${item.price}".text.xl3.color(red900).bold.make(),
            //? In velocity_x empty SizedBox can be created like /* <height in double>.heightBox
            SizedBox(
              height: 45,
              // width: 140,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: WidgetStatePropertyAll(EdgeInsets.all(10)),
                  backgroundColor: WidgetStatePropertyAll(darkBluishColor),
                ),
                child: "Add to Cart".text.xl2.color(creamColor).make(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
