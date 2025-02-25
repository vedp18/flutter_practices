import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.deepPurple,
      shadowColor: Colors.deepPurple,
      child: ListTile(
        leading: Image.network(item.imageUrl),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price.toString()}",
          textScaler: TextScaler.linear(1.6),
          style: TextStyle(
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}
