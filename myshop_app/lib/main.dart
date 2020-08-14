import 'package:flutter/material.dart';
import 'package:myshopapp/Model/orders.dart';
import 'package:myshopapp/Model/products.dart';
import 'package:myshopapp/Screens/cart_screen.dart';
import 'package:myshopapp/Screens/edit_product_screen.dart';
import 'package:myshopapp/Screens/products_overview_screen.dart';
import 'package:myshopapp/Screens/user_products_screen.dart';
import 'Screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import 'Model/cart.dart';
import 'Screens/orders_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Products()),
          ChangeNotifierProvider(create: (context) => Cart()),
          ChangeNotifierProvider(create: (context) => Orders()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
            CartScreen.routeName: (context) => CartScreen(),
            OrdersScreen.routeName: (context) => OrdersScreen(),
            UserProductsScreen.routeName: (context) => UserProductsScreen(),
            EditProductScreen.routeName: (context) => EditProductScreen(),
          },
        ));
  }
}
