import 'package:flutter/material.dart';

class BackGroundPantalla extends StatelessWidget{
  final Widget child;

  BackGroundPantalla ({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

          children: <Widget>[
            Container(
              margin:EdgeInsets.only(
                  // top: 30.0,
                  // right: 3.0,
                  // left: 3.0
              ),
              height: 780.0,
              width: 370.0,
              decoration: new BoxDecoration(
                  border: Border.all(),
                  color: Colors.white,
                  boxShadow: [
                    new BoxShadow(
                        color: Color(0xFFc5cdd9),

                        offset: new Offset(10.0, 10.0),
                        blurRadius: 10.0
                    )
                  ],



              ),
              child: child,

            )
    ],
    ),
    );
  }

}