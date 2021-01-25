import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lotery/src/ui/HomePage.dart';

class NavegadorBarraInferior extends StatefulWidget {
  final String initialRoute;
  final ValueChanged<String> navCallback;

  NavegadorBarraInferior({
    Key key,
    this.initialRoute: '/',
    @required this.navCallback,
  }) : super(key: key);

  @override
  _BottomNavState createState() => new _BottomNavState();
}

class _BottomNavState extends State<NavegadorBarraInferior> {
  String _currentRoute;
  final bool seleccionado = false;
  @override
  void initState() {
    super.initState();
    _currentRoute = widget.initialRoute;
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.white,
      elevation: 12.0,
      child: new Container(
        height: 56.0,
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildButton('/', "La Primitiva", "Vendes"),
            _buildButton('/vendes', "Eurimillons", "Vendes"),
            _buildButton('/vendes', "Loteria Nacional", "Vendes"),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String namedRoute, String data, String tooltip) {
    final ThemeData theme = Theme.of(context);

    return new Flexible(
      flex: 1,
      child: Tooltip(
        decoration: const BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        message: tooltip,
        child: new InkWell(
          focusColor: seleccionado ? Colors.teal : Colors.grey,
          onTap: () => onButtonTap(namedRoute, seleccionado),
          child: new Center(
            child: new Text(
              data,

              //color: _currentRoute == namedRoute ? theme.accentColor : theme.disabledColor,
            ),
          ),
        ),
      ),
    );
  }

  onButtonTap(String namedRoute, bool seleccionado) {
    setState(() {
      _currentRoute = namedRoute;
      seleccionado:
      _currentRoute = namedRoute;
    });
    widget.navCallback(_currentRoute);
  }
}
