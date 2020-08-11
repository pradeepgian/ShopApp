import 'package:flutter/material.dart';
import 'package:myshopapp/Model/cart.dart';
import '../widget/products_grid.dart';
import '../widget/badge.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var isFavorite = false;
  @override
  Widget build(BuildContext context) {
//    final productsContainer = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  isFavorite = true;
                } else {
                  isFavorite = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
              builder: (_, cartData, ch) => Badge(
                  child: ch,
                  value: cartData.itemCount.toString(),
              ),
            child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {}
                )
          ),
        ],
      ),
      body: ProductsGrid(
        showFavs: isFavorite,
      ),
    );
  }
}
