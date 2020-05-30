import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class AppBarTitle extends StatelessWidget {

  final double barHeight = 106.0;

  const AppBarTitle();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(

        children: <Widget>[

          Container(child: Icon(
            FontAwesomeIcons.bars, color: Colors.white,),),
          Spacer(),
         Image(image: AssetImage('images/mBankBrancoTrans.png'), width:40),


          Container(child: Text(
            'MailBank',
            style: TextStyle(
              color: Colors.white,
                fontFamily: 'Poppins',
                fontSize: 20.0
            ),
          ),),
          Spacer(),
          Container(child: Icon(
            FontAwesomeIcons.cog, color: Colors.white,),),

        ],
      ),
    );
  }
}