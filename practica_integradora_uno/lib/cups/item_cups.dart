import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cups/item_cups_details.dart';
import 'package:practica_integradora_uno/models/product_cup.dart';

class ItemCups extends StatefulWidget {
  final ProductCup cup;
  ItemCups({
    Key key,
    @required this.cup,
  }) : super(key: key);

  @override
  _ItemCupsState createState() => _ItemCupsState();
}

class _ItemCupsState extends State<ItemCups> {

Color funcColor(){
    if(widget.cup.liked)
      return Colors.red;
    else
      return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    //return Container(child: Text("${widget.drink.productTitle}"));
    return GestureDetector(
      onTap: () => _openCupsPage(),
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.all(8.0),
        color: Theme.of(context).cardColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    "${widget.cup.productTitle}",
                    style: Theme.of(context).textTheme.title.copyWith(
                        color: Colors.white, fontFamily: 'AkzidenzGrotesk'),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      Text(
                        "${widget.cup.productPrice}0",
                        style: Theme.of(context).textTheme.title.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 22),
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
                  "${widget.cup.productImage}",
                  fit: BoxFit.fitHeight,
                  height: 180,
                ),
              ),
              flex: 3,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 150),
              child: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: funcColor(),
                  ),
                  onPressed: () {
                    setState(() {
                      Color a = funcColor();
                      if (a == Colors.black) {
                        widget.cup.liked = true;
                      } else {
                        widget.cup.liked = false;
                      }
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void _openCupsPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ItemCupsDetails(cup: widget.cup);
        },
      ),
    );
  }
}
