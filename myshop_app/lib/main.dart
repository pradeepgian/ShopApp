import 'package:flutter/material.dart';
import 'package:myshopapp/Model/products.dart';
import 'package:myshopapp/Screens/products_overview_screen.dart';
import 'Screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import 'Model/cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider.value(value: Products()),
      ChangeNotifierProvider.value(value: Cart()),
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
            ProductDetailScreen.routeName : (context) => ProductDetailScreen(),
          },
        ));
  }
}