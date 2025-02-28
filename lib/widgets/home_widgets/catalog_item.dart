import 'package:flutter/material.dart';
import 'package:flutter_catalog/color.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/home_widgets/item_image.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogItem extends StatelessWidget {
  final Item item;
  const CatalogItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(item.id.toString()),
            child: ItemImage(imageUrl: item.imageUrl),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
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
                  //? but it is depriccated and replaced with OverflowBar which does same thing but detached from material
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: OverflowBar(
                      alignment: MainAxisAlignment.spaceBetween,

                      // buttonPadding: EdgeInsets.only(
                      //   top: 8,
                      //   right: 16,
                      // ),
                      children: [
                        "\$${item.price}".text.lg.bold.make(),
                        //? In velocity_x empty SizedBox can be created like /* <height in double>.heightBox
                        SizedBox(
                          // height: 34,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              // fixedSize: WidgetStatePropertyAll(Size(90, 25)),
                              padding:
                                  WidgetStatePropertyAll(EdgeInsets.all(10)),
                              backgroundColor:
                                  WidgetStatePropertyAll(darkBluishColor),
                            ),
                            child: "Add to Cart"
                                .text
                                .size(12)
                                .color(creamColor)
                                .make(),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ).color(creamColor).rounded.square(140).make().pSymmetric(v: 14);
  }
}
