import 'package:componentesmac/src/pages/alert_page.dart';
import 'package:componentesmac/src/providers/menu_provider.dart';
import 'package:componentesmac/src/utils/icono_string_utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('componente'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _CrearListaItem(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _CrearListaItem(List<dynamic> data, BuildContext context) {
    //creo mi variable para mostrar la lista de widget que llega por parametro del json
    final List<Widget> opciones = [];
    //validamos si la data viene vacia
    if (data == null) {
      return [];
    }

    data.forEach((opt) {
      final widgetemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          Navigator.pushNamed(context, opt['ruta']);
          // final route = MaterialPageRoute(builder: (context) => AlertPage());
          //  Navigator.push(context, route);
        },
      );

      opciones..add(widgetemp)..add(Divider());
    });

    return opciones;
  }
}
