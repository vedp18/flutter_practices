import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemImage extends StatelessWidget {
  final String imageUrl;

  const ItemImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl)
        .box
        .square(
            100) // without this initially it comes in circular shape and when image loads successfully then it comes to rounded squares
        .rounded
        .padding(EdgeInsets.all(10))
        .color(Colors.white)
        .make()
        .p20();
  }
}
