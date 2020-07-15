import 'package:flutter/material.dart';

//stle para crear la clase de forma rapida
class HomePageTem extends StatelessWidget {
  final opciones = [
    'Uno',
    'Dos',
    'Tres',
    'Cuatro',
    'Cinco',
    'Uno',
    'Dos',
    'Tres',
    'Cuatro',
    'Cinco'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes temporales'),
      ),
      body: ListView(
          //ListView muy pareceda a las columna y row
          children: _CrearItemCorto()),
    );
  }

  //creo mi metodo
  List<Widget> _crearItem() {
    //Instanciamos
    List<Widget> lista = new List<Widget>();
    for (String opt in opciones) {
      final TempWidget = ListTile(
        title: Text(opt),
      );
      lista..add(TempWidget)..add(Divider());
    }

    return lista;
  }

  //otra forma item corto
  List<Widget> _CrearItemCorto() {
    return opciones.map((item) {
      //retorna una lista de widget
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + '!mario'),
            subtitle: Text('subtitulo'),
            leading: Icon(Icons.account_balance_wallet),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
