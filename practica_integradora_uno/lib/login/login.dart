import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/home/home.dart';
import 'package:practica_integradora_uno/login/register.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

validate(String user, String pw, String cUser, String cPw, BuildContext context) {
  if(user == cUser && pw == cPw && cUser != null && cPw != null) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return Home(title: APP_TITLE);
      }),
    );
  } else {
    showAlertDialog(context);
  }
}

showAlertDialog(BuildContext context) {
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () { 
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("Error"),
    content: Text("Usuario y/o contraseña incorrectos."),
    actions: [
      okButton,
    ],
  );
  
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
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
                  scale: 3,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
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
                  hintText: 'John Doe',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 0, 5),
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
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.white),
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
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  child: Text("ENTRAR", style: Theme.of(context).textTheme.body1,
                  ),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    validate(PROFILE_NAME, PROFILE_PW, _usernameController.text, _passwordController.text, context);
                  },
                  height: 50,
                  minWidth: 370,
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10)),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("¿Olvidaste tu password?", style: Theme.of(context).textTheme.body2),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("¿Aún no tienes una cuenta?", style: Theme.of(context).textTheme.body2),
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
                      return Register();
                    }),
                  );
                },
                child: Text("REGÍSTRATE", style: TextStyle(color: Colors.white, decoration: TextDecoration.underline)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}