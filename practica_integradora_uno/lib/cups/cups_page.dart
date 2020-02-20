import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cart/cart.dart';
import 'package:practica_integradora_uno/cups/item_cups.dart';
import 'package:practica_integradora_uno/models/product_cup.dart';
import 'package:practica_integradora_uno/profile.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class CupsPage extends StatelessWidget {
  final List<ProductCup> cupsList;
  CupsPage({
    Key key,
    @required this.cupsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tazas"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Profile()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Cart(productsList: cartList)),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: cupsList.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemCups(
            cup: cupsList[index],
          );
        },
      ),
    );
  }
}
