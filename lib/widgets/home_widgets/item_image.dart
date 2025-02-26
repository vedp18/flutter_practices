import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

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
