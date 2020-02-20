import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/login/login.dart';
import 'package:practica_integradora_uno/login/register.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class Startup extends StatelessWidget {
  const Startup({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Image.asset(
                "assets/cupping.png",
                scale: 2.4,
              )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  child: Text("REGÍSTRATE", style: Theme.of(context).textTheme.body1),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return Register();
                    }),
                  );
                  },
                  height: 50,
                  minWidth: 370,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                child: Text("INGRESA", style: Theme.of(context).textTheme.body1,
                ),
                color: Theme.of(context).accentColor,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return Login();
                    }),
                  );
                },
                height: 50,
                minWidth: 370,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
