import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:mailbank/components/myflexiableappbar.dart';
import 'package:mailbank/components/myappbar.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Color(0xff33333c),
        body: CustomScrollView(

          slivers: <Widget>[
            SliverAppBar(
              title: AppBarTitle(),
              pinned: true,
              expandedHeight: 120.0,
              flexibleSpace: FlexibleSpaceBar(
                background: FlexiableAppBarHome(),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(

                <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      decoration: BoxDecoration(color: Color(0xff4d4d54),
                      shape: BoxShape.rectangle,
                      ),



                      child: ExpansionTile(
                        backgroundColor: Color(0xff4d4d54),


                        title: Text('Saldo Disponivel'
                        ,
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Roboto',
                                fontSize: 26.0
                            )),
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[

                                Text(
                                    r"R$",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Roboto',
                                        fontSize: 26.0
                                    )
                                ),
                                Text(
                                    "250",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Roboto',
                                        fontSize: 26.0
                                    )
                                )

                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  )


                ],
              ),
            ),
          ],
        )
    );
  }
}
