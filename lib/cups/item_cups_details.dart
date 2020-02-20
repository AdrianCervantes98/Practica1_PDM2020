import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cart/pay.dart';
import 'package:practica_integradora_uno/models/product_cup.dart';
import 'package:practica_integradora_uno/models/product_item_cart.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class ItemCupsDetails extends StatefulWidget {
  final ProductCup cup;
  ItemCupsDetails({Key key, @required this.cup}) : super(key: key);

  @override
  _ItemCupsDetailsState createState() => _ItemCupsDetailsState();
}

class _ItemCupsDetailsState extends State<ItemCupsDetails> {
  Color liked() {
    if (widget.cup.liked == true)
      return Colors.red;
    else
      return Colors.black;
  }
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var price = widget.cup.productPrice;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("${widget.cup.productTitle}"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(30),
            color: IMAGE_BG_COLOR,
            child: Column(
              children: <Widget>[
                Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.favorite,
                      color: liked(),
                    )),
                Image.network(
                  "${widget.cup.productImage}",
                  width: 200,
                  height: 200,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: Text(
              "${widget.cup.productTitle}",
              style: Theme.of(context).textTheme.title.copyWith(fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 150, 0),
            child: Text(
              "${widget.cup.productDescription}",
              style: Theme.of(context).textTheme.title.copyWith(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 65, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "COLORES DISPONIBLES",
                  style:
                      Theme.of(context).textTheme.body1.copyWith(fontSize: 12),
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.attach_money),
                    Text(
                      "$price",
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(fontSize: 32),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MaterialButton(
                onPressed: () {
                  setState(() {
                    widget.cup.productColor = ProductColor.BLANCO;
                    widget.cup.productPrice = widget.cup.productPriceCalculator();
                    price = widget.cup.productPrice;
                  });
                },
                color: Colors.white,
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    widget.cup.productColor = ProductColor.NEGRO;
                    widget.cup.productPrice = widget.cup.productPriceCalculator();
                    price = widget.cup.productPrice;
                  });
                },
                color: Colors.black,
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    widget.cup.productColor = ProductColor.AZUL;
                    widget.cup.productPrice = widget.cup.productPriceCalculator();
                    price = widget.cup.productPrice;
                  });
                },
                color: Colors.blue,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  child: Text(
                    "AGREGAR AL CARRITO",
                    style: Theme.of(context).textTheme.body2,
                  ),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    addToCart();
                  },
                  height: 50,
                  minWidth: 190,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10)),
                ),
                MaterialButton(
                  child: Text(
                    "COMPRAR AHORA",
                    style: Theme.of(context).textTheme.body2,
                  ),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                     Navigator.of(context).push(
                      MaterialPageRoute(builder: (context){
                        return Pay();
                      })
                    );
                  },
                  height: 50,
                  minWidth: 190,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _displaySnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text("$text"));
    _scaffoldKey.currentState..hideCurrentSnackBar()..showSnackBar(snackBar); 
  }

  void addToCart() {
    if(!prodsInCart.contains(widget.cup.productTitle)) {
      ProductItemCart prod = new ProductItemCart(productTitle: widget.cup.productTitle, productAmount: widget.cup.productAmount, productPrice: widget.cup.productPrice, productImage: widget.cup.productImage, liked: widget.cup.liked);
      cartList.add(prod);
      prodsInCart.add(widget.cup.productTitle);
      _displaySnackBar(context, "¡Producto añadido!");
    } else {
      _displaySnackBar(context, "El producto ya se encuentra en el carrito.");
    }
  }
}