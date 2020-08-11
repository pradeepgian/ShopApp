import 'package:flutter/material.dart';
import 'package:myshopapp/Model/products.dart';
import '../widget/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {

  final bool showFavs;
  ProductsGrid({this.showFavs = false});
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.items;

    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
//        create: (context) => loadedProducts[index],
        value: products[index],
        child: ProductItem(),
      ),
      itemCount: products.length,
    );
  }
}
