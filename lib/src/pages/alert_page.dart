import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estamos en la pagina de alert'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar alerta'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _mostrarAlerta(context),
        ),
      ),
      //boton para regresar
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        //funcion para regresar atras cuando presionemos el boton
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  //metodo para mostrar la alerta
  void _mostrarAlerta(BuildContext context) {
    showDialog(
        //para que el show dialogo se pueda cerrar presionando click en cualquier lado
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text('titulo'),
            content: Column(
              //para que no se estire la tarjeta
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('este es el contenido de la caja de ala alerta'),
                FlutterLogo(size: 100.0)
              ],
            ),

            //botones lista de widget
            actions: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }
}
