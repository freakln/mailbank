import 'package:flutter/material.dart';


class FlexiableAppBarHome extends StatelessWidget {
 final String user ='teste';
  final double appBarHeight = 66.0;

  FlexiableAppBarHome();

  @override
  Widget build(BuildContext context ) {
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    return new Container(
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + appBarHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Row(
                    children: <Widget>[new Text(
                  "Olá,",
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontSize: 26.0
                  )
              ),


                      Text(
                        user,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontSize: 26.0
                )
            )],
                  ),
                  Row(



                    children: <Widget>[
                      Container(child: new Text(
                          "Ag ",
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 20.0
                          )
                      ),),

                      Container(child: new Text(
                          "9999",
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w800,
                              fontSize: 25.0
                          )
                      ),),
                      SizedBox(
                        width: 10,
                      ),
                    Container(child: new Text(
                        "Cc",
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 20.0
                        )
                    ),),
                    Container(child: new Text(
                        "12345-6",
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w800,
                            fontSize: 26.0
                        )
                    ),),

                  ],)
                ],),),
          ),




        ],),
      decoration: new BoxDecoration(
        color: Color(0xff4d4d54),

      ),
    );
  }
}

