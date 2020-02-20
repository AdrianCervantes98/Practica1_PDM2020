import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/graincoffee/item_grains_details.dart';
import 'package:practica_integradora_uno/models/product_grains.dart';

class ItemGrains extends StatefulWidget {
  final ProductGrains grain;
  ItemGrains({
    Key key,
    @required this.grain,
  }) : super(key: key);

  @override
  _ItemGrainsState createState() => _ItemGrainsState();
}

class _ItemGrainsState extends State<ItemGrains> {

Color funcColor(){
    if(widget.grain.liked)
      return Colors.red;
    else
      return Colors.black;
  }
  @override
  Widget build(BuildContext context) {
    //return Container(child: Text("${widget.drink.productTitle}"));
    return GestureDetector(
      onTap: () => _openGrainsPage(),
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
                    "${widget.grain.productTitle}",
                    style: Theme.of(context).textTheme.title.copyWith(
                        color: Colors.white, fontFamily: 'AkzidenzGrotesk'),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      Text(
                        "${widget.grain.productPrice}0",
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
                  "${widget.grain.productImage}",
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
                        widget.grain.liked = true;
                      } else {
                        widget.grain.liked = false;
                      }
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void _openGrainsPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ItemGrainsDetails(grains: widget.grain);
        },
      ),
    );
  }
}
