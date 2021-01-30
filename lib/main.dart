import 'package:flutter/material.dart';

void main() => runApp(HopePage());

class HopePage extends StatefulWidget {
  @override
  _HopePageState createState() => _HopePageState();
}

class _HopePageState extends State<HopePage> {
  bool isPressedUp = false;
  bool isPressedDown = false;
  int counter = 0;
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: _scaffoldKey.currentContext,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("¿Es Par?"),
          content: (counter%2==0)?Text("El contador de likes es par"):Text("${DateTime.now()}"),
          actions: [
            FlatButton(
              textColor: Color(0xFF6200EE),
              onPressed: () {Navigator.of(context, rootNavigator: true).pop();},
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('ITESO App'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/ITESO_60_años.jpg"),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("ITESO, Universidad Jesuita de Guadalajara",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("San Pedro Tlaquepaque"),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.thumb_up,
                        color: isPressedUp ? Colors.blue : Colors.grey[600],
                      ),
                      onPressed: () {
                        if (isPressedUp == false) {
                          isPressedDown = false;
                        }
                        isPressedUp = !isPressedUp;
                        counter++;
                        setState(() {});
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.thumb_down,
                        color: isPressedDown ? Colors.red : Colors.grey[600],
                      ),
                      onPressed: () {
                        if (isPressedDown == false) {
                          isPressedUp = false;
                        }
                        isPressedDown = !isPressedDown;
                        if (counter > 0) {
                          counter--;
                        }

                        setState(() {});
                      },
                    ),
                    Text('$counter'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          IconButton(
                            iconSize: 64,
                            icon: Icon(Icons.mail),
                            onPressed: () {
                              _scaffoldKey.currentState
                                ..hideCurrentSnackBar()
                                ..showSnackBar(SnackBar(
                                  content: Text(
                                      "Para recibir información contactar con: dse@iteso.mx"),
                                ));
                            },
                          ),
                          Text("Correo"),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          IconButton(
                            iconSize: 64,
                            icon: Icon(Icons.add_call),
                            onPressed: () {
                              _scaffoldKey.currentState
                                ..hideCurrentSnackBar()
                                ..showSnackBar(SnackBar(
                                  content: Text(
                                      "Número oficial del ITESO: (33) 3669 3434"),
                                ));
                            },
                          ),
                          Text("Llamada"),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          IconButton(
                            iconSize: 64,
                            icon: Icon(Icons.directions),
                            onPressed: () {
                              _scaffoldKey.currentState
                                ..hideCurrentSnackBar()
                                ..showSnackBar(SnackBar(
                                  content: Text(
                                      "Para más información: https://www.iteso.mx/"),
                                ));
                            },
                          ),
                          Text("Ruta"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Text(
                        "El ITESO, Universidad Jesuita de Guadalajara, es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957. Fundada en el año de 1957 por el ingeniero José Fernández del Valle y Ancira, entre otros, la universidad ha tenido una larga trayectoria. A continuación se presenta la historia de la institución en periodos de décadas. Con 49 hectáreas, el campus del ITESO se extiende al sur de la Zona Metropolitana de Guadalajara en el municipio de Tlaquepaque, Jalisco, México. El campus conserva 22 hectáreas de áreas verdes, en las que hay más de 3,000 árboles de 280 especies. Actualmente, son 43 los edificios que albergan las actividades de la universidad."),
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.trending_up),
          onPressed: () {
            _showDialog();
          },
        ),
      ),
    );
  }
}
