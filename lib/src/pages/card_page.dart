import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarjetas'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      //sombra de la tarjeta
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      //las tarjetas lo principal es el child ya que puedo colocar cualquier cosa
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Soy el titulo de esta tarjeta'),
            subtitle: Text(
                'esta parte es el subtitulo que estoy colocando en practica con el curso de herrera'),
          ),
          Row(
            //propiedad para colocar fila fila al final
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  // segundo metodo para las tarjetas donde me muestra un placeholder mientras la pagina original se esta cargando
  Widget _cardTipo2() {
    final card = Container(
      //nos ayuda a que nada e lo que esta en la tarjeta se salga de la tarjeta

      //tarjeta con imagen para colocar con placeolder
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'https://i.ytimg.com/vi/WGGYN9byZMA/maxresdefault.jpg'),
            //mientras este cargando el imagen http me muestre el gif de cargando
            placeholder: AssetImage('assets/loading.gif'),
            //con una duracion de 20milisegundo
            fadeInDuration: Duration(milliseconds: 500),
            height: 250.0,
            // como la imagen ocupa en la pantalla
            fit: BoxFit.cover,
          ),

          /*  Image(
             //cargar una imagen desde una url
             image:NetworkImage('https://www.yourtrainingedge.com/wp-content/uploads/2019/05/background-calm-clouds-747964.jpg'),
           )*/
          //como si fuera un div en html el container
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text('Dame fortaliza señor'))
        ],
      ),
    );

    //lo retorno en un div como html
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white, // sombreado
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                //que tantonquiero que se extienda
                spreadRadius: 2.0,
                //la posicion coordenada plano cartesinao dx, dy
                offset: Offset(2.0, 10.0))
          ]),
      //llamo a la variable card y clipRRect nos ayuda a cortar algun borde que se encuentre por fuera de ese borde
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}
