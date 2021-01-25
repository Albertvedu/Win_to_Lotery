import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lotery/src/blocs/LaPrimitiva.dart';
import 'package:toast/toast.dart';
import 'NavegadorBarraInferior.dart';

final colorBackground = const Color(0xFFF3F4F7);
final colorPrimary = const Color(0xFF35465B);
final colorAccent = const Color(0xFF7576FD);
final colorGrey = const Color(0xFFA5ADB7);

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: new Navigator(
              key: _navigatorKey,
              onGenerateRoute: _onGenerateRoute,
            ),
          ),
          NavegadorBarraInferior(navCallback: (String namedRoute) {
            print("Navigating to $namedRoute");
            _navigatorKey.currentState.pushReplacementNamed(namedRoute);
          }),
        ],
      ),
    );
  }

// Barra menu inferior
  Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    Widget child;
    if (settings.name == '/') {
      child = ScreenHome();
    } else if (settings.name == '/vendes') {
      // child =  MenuVendes();
    } else if (settings.name == '/compres') {
      //  child =  MenuCompras();
    } else if (settings.name == '/factures') {
      //  child =  MenuFactures();
    }

    if (child != null) {
      return MaterialPageRoute(builder: (c) => child);
    }
    return null;
  }
}

class ScreenHome extends StatefulWidget {
  @override
  _ScreenHomeState createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  bool _optionAutomatic = false;
  bool _validedGame = true;
  String _text1 = 'Introdueix la teva combinació';
  String _text2 = "Combinació errónea";
  final _formKey = GlobalKey<FormState>();
  var _gameManual = [0, 0, 0, 0, 0, 0];
  var _gameAutomatic = [0, 0, 0, 0, 0, 0];
  var _game = [0, 0, 0, 0, 0, 0];
  List _betsList = [];
  var textValided = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          header(),
          insertCombi(),
          SizedBox(height: 20.0,),
          bets(),
          SizedBox(height: 20.0,),
          otra(),
        ],
      ),
    ));
  }

  otra(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70.0,
        width: 350.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: _buttonRandom("Jugar"),
      ),
    );
  }
  bets() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120.0,
        width: 350.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: listBets(),
      ),
    );
  }

//_betsList[index][0] < 10 ? "0"+_betsList[index][0].toString()
  listBets() {
    return ListView.builder(
        itemCount: _betsList.length,
        itemBuilder: (context, index) {
          //return betLine(context, index);
          return Row(
            children: [
              Text((index + 1).toString() + "·\t\t\t\t\t\t"),
              betLine(context, index, 0),
              betLine(context, index, 1),
              betLine(context, index, 2),
              betLine(context, index, 3),
              betLine(context, index, 4),
              betLine(context, index, 5),
            ],
          );
          //  return Text((index + 1).toString() + "·\t\t\t\t\t\t" +
          //      _betsList[index][0].toString()
          //      + "\t\t\t" + _betsList[index][1].toString()
          //      + "\t\t\t" + _betsList[index][2].toString()
          //      + "\t\t\t" + _betsList[index][3].toString()
          //      + "\t\t\t" + _betsList[index][4].toString()
          //      + "\t\t\t" + _betsList[index][5].toString(),
          //    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),);
        });
  }

  Widget betLine(BuildContext context, int index, int i) {
    return
         Text(_betsList[index][i] < 10 ?
            "0" + _betsList[index][i].toString() + "  " : _betsList[index][i].toString() + "  ",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
          );
        // : Text(
        //     _betsList[index][i].toString() + "  ",
        //     style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
        //   );
  }

  header() {
    return Container(
      height: 60,
      width: 60.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(70.0),
        color: Colors.green,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Image.asset("image/loteria.png"),
      ),
    );
  }

  insertCombi() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
        left: 10.0,
      ),
      child: Form(
        key: _formKey,
        child: Container(
            height: 220.0,
            width: 350.0,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF0D47A1),
                  Color(0xFF1976D2),
                  Color(0xFF42A5F5),
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _text1,
                    style: TextStyle(fontSize: 19.0),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                _optionAutomatic ? automaticGame() : manualGame(),
                SizedBox(
                  height: 35.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _optionAutomatic
                        ? _buttonRandom('Insertar combinación Manual')
                        : _buttonRandom('Obtener combinación aleatoria'),
                    _butonValidated(),
                  ],
                ),
              ],
            )),
      ),
    );
  }

  Row manualGame() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        roundedNumbersManual(0),
        roundedNumbersManual(1),
        roundedNumbersManual(2),
        roundedNumbersManual(3),
        roundedNumbersManual(4),
        roundedNumbersManual(5),
      ],
    );
  }

  Row automaticGame() {
    _gameAutomatic = LaPrimitiva().sorteig();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _roundedNumbersAutomatic(0),
        _roundedNumbersAutomatic(1),
        _roundedNumbersAutomatic(2),
        _roundedNumbersAutomatic(3),
        _roundedNumbersAutomatic(4),
        _roundedNumbersAutomatic(5),
      ],
    );
  }

  OutlineButton _buttonRandom(String nameButton) {
    return OutlineButton(
        shape: StadiumBorder(),
        textColor: Colors.black,
        child: Text(nameButton),
        borderSide: BorderSide(
            color: Colors.yellow, style: BorderStyle.solid, width: 1),
        onPressed: () {
          setState(() {
            nameButton == 'Obtener combinación aleatoria'
                ? _optionAutomatic = true
                : _optionAutomatic = false;
            nameButton == 'Insertar combinación Manual'
                ? _text1 = "Insertar combinación Manual"
                : _text1 = "La teva combinació";
          });
        });
  }

  OutlineButton _butonValidated() {
    return OutlineButton(
        shape: StadiumBorder(),
        textColor: Colors.black,
        child: Text('Validar'),
        borderSide: BorderSide(
            color: Colors.yellow, style: BorderStyle.solid, width: 1),
        onPressed: () {
          setState(() {
            _validedGame = LaPrimitiva().validedPrimitiva(
                _optionAutomatic ? _gameAutomatic : _gameManual);

            if (_validedGame) {
              _optionAutomatic
                  ? _betsList.add(_gameAutomatic)
                  : _betsList.add(_gameManual);
              _optionAutomatic = false;
              _gameManual = [0, 0, 0, 0, 0, 0];
              _gameAutomatic = [0, 0, 0, 0, 0, 0];
              _text1 = 'Introdueix la teva combinació';
            } else
              Toast.show("Combinació errónea", context,
                  duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
          });
          print(
              ".................................. validgame................. " +
                  _validedGame.toString() +
                  " bets " +
                  _betsList.toString());
        });
  }

  roundedNumbersManual(int i) {
    final myController = TextEditingController();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        color: Colors.white,
      ),
      height: 50.0,
      width: 50.0,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 0,
        ),
        child: TextFormField(
          controller: myController,
          // per obtenir valor del texfield i despres pasarlo a Int
          keyboardType: TextInputType.number,
          //Mostrara teclado numérico
          autofocus: false,
          maxLength: 2,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 20.0,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            counterText: textValided,
          ),
          textInputAction: TextInputAction.next,
          //proximo foco
          onChanged: (myController) {
            int.parse(myController) > 49
                ? Toast.show("ONLY NUMBERS 1 to 49", context,
                    duration: Toast.LENGTH_LONG, gravity: Toast.CENTER)
                : null;
            _gameManual[i] = int.parse(myController);
          },
        ),
      ),
    );
  }

  Container _roundedNumbersAutomatic(int i) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        color: Colors.white,
      ),
      height: 50.0,
      width: 50.0,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 12.0,
        ),
        child: Text(
          _gameAutomatic[i] < 10
              ? "0" + _gameAutomatic[i].toString()
              : _gameAutomatic[i].toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
