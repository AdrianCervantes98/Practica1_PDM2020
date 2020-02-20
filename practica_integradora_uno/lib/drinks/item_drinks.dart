import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/drinks/item_drinks_details.dart';
import 'package:practica_integradora_uno/models/product_drinks.dart';

class ItemDrinks extends StatefulWidget {
  final ProductDrinks drink;
  ItemDrinks({
    Key key,
    @required this.drink,
  }) : super(key: key);

  @override
  _ItemDrinksState createState() => _ItemDrinksState();
}

class _ItemDrinksState extends State<ItemDrinks> {
  

  Color funcColor(){
    if(widget.drink.liked)
      return Colors.red;
    else
      return Colors.black;
  }  

  @override
  Widget build(BuildContext context) {
    //return Container(child: Text("${widget.drink.productTitle}"));
    return GestureDetector(
      onTap: () => _openDrinksPage(),
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.all(8.0),
        color: Theme.of(context).cardColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    "${widget.drink.productTitle}",
                    style: Theme.of(context).textTheme.title.copyWith(
                        color: Colors.white, fontFamily: 'AkzidenzGrotesk'),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      Text(
                        "${widget.drink.productPrice}0",
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .copyWith(fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ],
                  ),
                ],
              ),
              flex: 2,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5.0),
                  bottomRight: Radius.circular(5.0),
                ),
                child: Image.network(
                  "${widget.drink.productImage}",
                  fit: BoxFit.fitHeight,
                  height: 180,
                ),
              ),
              flex: 3,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 150),
              child: IconButton(icon: Icon(Icons.favorite, color: funcColor(),), onPressed: (){
                setState(() {
                  Color a = funcColor();
                  if(a == Colors.black){
                    widget.drink.liked = true;
                  } else {
                    widget.drink.liked = false;
                  }   
                });
              }),
            ),
          ],
        ),
      ),
    );
  }
  void _openDrinksPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ItemDrinksDetails(drink: widget.drink);
        },
      ),
    );
  }
}


