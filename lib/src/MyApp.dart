import 'package:flutter/material.dart';

import 'ui/AppDrawer.dart';
import 'ui/HomePage.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TO WIN THE LOTTO',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(38.0), // here the desired height
              child: AppBar(
                title: Text("TO WIN THE LOTTO"),
              )
          ),
          drawer: AppDrawer(),
          body: Center(
            child: HomePage(),
          ),
        ));
  }
}