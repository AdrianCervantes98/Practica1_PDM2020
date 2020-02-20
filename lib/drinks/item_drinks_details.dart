import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cart/pay.dart';
import 'package:practica_integradora_uno/models/product_drinks.dart';
import 'package:practica_integradora_uno/models/product_item_cart.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class ItemDrinksDetails extends StatefulWidget {
  final ProductDrinks drink;
  ItemDrinksDetails({Key key, @required this.drink}) : super(key: key);

  @override
  _ItemDrinksDetailsState createState() => _ItemDrinksDetailsState();
}

class _ItemDrinksDetailsState extends State<ItemDrinksDetails> {
  Color liked() {
    if (widget.drink.liked == true)
      return Colors.red;
    else
      return Colors.black;
  }
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var price = widget.drink.productPrice;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("${widget.drink.productTitle}"),
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
                  "${widget.drink.productImage}",
                  width: 250,
                  height: 250,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: Text(
              "${widget.drink.productTitle}",
              style: Theme.of(context).textTheme.title.copyWith(fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 150, 0),
            child: Text(
              "${widget.drink.productDescription}",
              style: Theme.of(context).textTheme.title.copyWith(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 65, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "TAMAÑOS DISPONIBLES",
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.deepPurple),
                ),
                onPressed: () {
                  setState(() {
                    widget.drink.productSize = ProductSize.CH;
                    widget.drink.productPrice = widget.drink.productPriceCalculator();
                    price = widget.drink.productPrice;
                  });
                },
                color: Colors.white,
                child: Text("Chico"),
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.deepPurple),
                ),
                onPressed: () {
                  setState(() {
                    widget.drink.productSize = ProductSize.M;
                    widget.drink.productPrice = widget.drink.productPriceCalculator();
                    price = widget.drink.productPrice;
                  });
                },
                color: Colors.white,
                child: Text("Mediano"),
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.deepPurple),
                ),
                onPressed: () {
                  setState(() {
                    widget.drink.productSize = ProductSize.G;
                    widget.drink.productPrice = widget.drink.productPriceCalculator();
                    price = widget.drink.productPrice;
                  });
                },
                color: Colors.white,
                child: Text("Grande"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
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
    if(!prodsInCart.contains(widget.drink.productTitle)) {
      ProductItemCart prod = new ProductItemCart(productTitle: widget.drink.productTitle, productAmount: widget.drink.productAmount, productPrice: widget.drink.productPrice, productImage: widget.drink.productImage, liked: widget.drink.liked);
      cartList.add(prod);
      prodsInCart.add(widget.drink.productTitle);
      _displaySnackBar(context, "¡Producto añadido!");
    } else {
      _displaySnackBar(context, "El producto ya se encuentra en el carrito.");
    }
  }
}
