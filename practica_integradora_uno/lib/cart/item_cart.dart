import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cart/cart.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class ItemCart extends StatefulWidget {
  final dynamic product;
  final ValueChanged<double> onAmountUpdated;

  ItemCart({
    Key key,
    @required this.onAmountUpdated,
    @required this.product,
  }) : super(key: key);

  @override
  _ItemCartState createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Card(
        margin: EdgeInsets.all(24),
        color: IMAGE_BG_COLOR,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(widget.product.productImage, height: 300, width: 100,),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("${widget.product.productTitle}", style: Theme.of(context).textTheme.title,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.remove_circle), onPressed: _remProd),
                    Text("${widget.product.productAmount}", style: Theme.of(context).textTheme.title,),
                    IconButton(icon: Icon(Icons.add_circle_outline), onPressed: _addProd),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.attach_money),
                    Text("${widget.product.productPrice}0", style: Theme.of(context).textTheme.title.copyWith(fontSize: 28),),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.favorite, color: liked()),
                IconButton(icon: Icon(Icons.restore_from_trash), onPressed: (){
                  removeCart();
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color liked() {
    if (widget.product.liked == true)
      return Colors.red;
    else
      return Colors.black;
  }

  void _addProd() {
    setState(() {
      ++widget.product.productAmount;
    });
    widget.onAmountUpdated(widget.product.productPrice);
  }

  void removeCart() {
    cartList.remove(widget.product);
    prodsInCart.remove(widget.product.productTitle);
    setState(() {
      widget.onAmountUpdated(-1*widget.product.productAmount*widget.product.productPrice);
    });
  }

  void _remProd() {
    if(widget.product.productAmount > 0){
      setState(() {
      --widget.product.productAmount;
      });
      widget.onAmountUpdated(-1 * widget.product.productPrice);
    }
  }
}
