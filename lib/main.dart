import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' ;
import 'package:mailbank/pages/registrer.dart';
void main() => runApp(MaterialApp(home: RegistrationApp()));

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
        backgroundColor: Color(0xff33333c),
        resizeToAvoidBottomPadding: false,
        body: Center(

        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container( margin: EdgeInsets.only(top: 77),
                  child: Image(image: AssetImage('assets/logo2.png'), width:MediaQuery.of(context).size.width * 0.6)),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xff44444b),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10))),

                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 15,right: 15,top: 40),
                  child: Form(
                    key: _formKey,
                    child: Column(
                        children: <Widget>[
                          Container(
                            margin: const  EdgeInsets.only(bottom: 30),
                            child: TextFormField(
                                 style: TextStyle(color: Color(0xffbdbdbd)),
                                 validator: (value) {
                                  if (value.isEmpty) {
                                  return 'Digite um E-mail';
                                  }
                                  return null;
                                  },
                                decoration: InputDecoration(
                                filled: false,
                                fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(color: Colors.white, width: 2.0)
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.white, width: 2.0),
                                    ),
                                border: OutlineInputBorder(),
                                labelText: 'Email',
                                labelStyle: new TextStyle(
                                  fontFamily: 'roboto',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffbdbdbd),
                                  letterSpacing: 1

                                )
                              ),
                            ),
                          ),
                          TextFormField(
                            style: TextStyle(color: Color(0xffbdbdbd)),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Campo de senha não pode ser Vazio';
                              }
                              return null;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: false,
                              fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.white, width: 2.0)
                                ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                              ),
                              border: OutlineInputBorder(

                              ),
                              labelText: 'Password',
                                labelStyle: new TextStyle(
                                    fontFamily: 'roboto',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffbdbdbd),
                                    letterSpacing: 1

                                )
                            ),
                          ),
                          FlatButton(
                            color: Colors.transparent,
                            textColor: Colors.white,
                            disabledColor: Colors.grey,
                            disabledTextColor: Colors.red,
                            padding: EdgeInsets.only(top: 15),
                            onPressed: () {
                              /*...*/
                            },
                            child: Text(
                              "Esqueci minha senha",
                              style: TextStyle(fontSize: 15.0,decoration: TextDecoration.underline, fontWeight: FontWeight.w400),
                            ),
                          )
                        ],



                      ),
                  ),
                ),

              ),
              FlatButton(
                color: Color(0xff1eb980),
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 45,vertical: 20),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  if (_formKey.currentState.validate()) {

                    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
                  }
                },
                child: Text(
                  "ENTRAR",
                  style: TextStyle(fontSize: 20.0,color: Colors.black),
                ),
              ),
              FlatButton(
                color: Colors.transparent,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 45,vertical: 20),
                splashColor: Colors.yellow,
                onPressed: () {
                  /*...*/
                },
                child: Text(
                  "Cadastre-se",
                    style: TextStyle(fontSize: 15.0,decoration: TextDecoration.underline, fontWeight: FontWeight.w400),
                ),
              )


            ],
          ),
        ),
      ),

    );
  }
}
