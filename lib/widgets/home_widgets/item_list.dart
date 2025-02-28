import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/pages/item_detail_page.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_item.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items!.length,
      itemBuilder: (context, index) {
        final item = CatalogModel.items![index];
        return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ItemDetailPage(item: item) ));
          },
          child: CatalogItem(item: item),
        );
      },
    );
  }
}
