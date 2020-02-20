import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/login/login.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Image.asset(
                  "assets/cupping.png",
                  scale: 3.5,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 5),
            child: Row(
              children: <Widget>[
                Text("Nombre completo:", style: Theme.of(context).textTheme.body2),
              ],
            ),
          ),
          Container(
            width: 370,
            child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'John Doe',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 5),
            child: Row(
              children: <Widget>[
                Text("Email:", style: Theme.of(context).textTheme.body2),
              ],
            ),
          ),
          Container(
            width: 370,
            child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'sample@email.com',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 5),
            child: Row(
              children: <Widget>[
                Text("Password:", style: Theme.of(context).textTheme.body2,),
              ],
            ),
          ),
          Container(
            width: 370,
            child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.visibility_off),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
                obscureText: true,
                style: TextStyle(color: Colors.white),
              ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: BUTTON_COLOR,
              ),
              child: Row(
                children: <Widget>[
                  Checkbox(
                    value: check, 
                    hoverColor: Theme.of(context).accentColor,
                    onChanged: (bool value){setState(() {
                    check = value;
                  });}),
                  Text("ACEPTO LOS TÉRMINOS Y CONDICIONES DE USO", style: Theme.of(context).textTheme.body2,),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  child: Text("REGÍSTRATE", style: Theme.of(context).textTheme.body1,
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
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("¿Ya tienes una cuenta?", style: Theme.of(context).textTheme.body2),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return Login();
                    }),
                  );
                },
                child: Text("INGRESA", style: TextStyle(color: Colors.white, decoration: TextDecoration.underline)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}