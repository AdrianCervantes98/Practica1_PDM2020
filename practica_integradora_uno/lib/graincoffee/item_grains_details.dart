import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cart/pay.dart';
import 'package:practica_integradora_uno/models/product_grains.dart';
import 'package:practica_integradora_uno/models/product_item_cart.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class ItemGrainsDetails extends StatefulWidget {
  final ProductGrains grains;
  ItemGrainsDetails({Key key, @required this.grains}) : super(key: key);

  @override
  _ItemGrainsDetailsState createState() => _ItemGrainsDetailsState();
}

class _ItemGrainsDetailsState extends State<ItemGrainsDetails> {
  Color liked() {
    if (widget.grains.liked == true)
      return Colors.red;
    else
      return Colors.black;
  }
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var price = widget.grains.productPrice;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("${widget.grains.productTitle}"),
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
                  "${widget.grains.productImage}",
                  width: 250,
                  height: 250,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 220, 0),
            child: Text(
              "${widget.grains.productTitle}",
              style: Theme.of(context).textTheme.title.copyWith(fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 150, 0),
            child: Text(
              "${widget.grains.productDescription}",
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
                    widget.grains.productWeight = ProductWeight.CUARTO;
                    widget.grains.productPrice = widget.grains.productPriceCalculator();
                    price = widget.grains.productPrice;
                  });
                },
                color: Colors.white,
                child: Text("Cuarto"),
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.deepPurple),
                ),
                onPressed: () {
                  setState(() {
                    widget.grains.productWeight = ProductWeight.KILO;
                    widget.grains.productPrice = widget.grains.productPriceCalculator();
                    price = widget.grains.productPrice;
                  });
                },
                color: Colors.white,
                child: Text("Kilo"),
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
    if(!prodsInCart.contains(widget.grains.productTitle)) {
      ProductItemCart prod = new ProductItemCart(productTitle: widget.grains.productTitle, productAmount: widget.grains.productAmount, productPrice: widget.grains.productPrice, productImage: widget.grains.productImage, liked: widget.grains.liked);
      cartList.add(prod);
      prodsInCart.add(widget.grains.productTitle);
      _displaySnackBar(context, "¡Producto añadido!");
    } else {
      _displaySnackBar(context, "El producto ya se encuentra en el carrito.");
    }
  }
}