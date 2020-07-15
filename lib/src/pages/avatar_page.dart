import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  static final PageName = 'avatar';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estamos en la pagina del avatar'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://scontent.fctg1-1.fna.fbcdn.net/v/t1.0-9/s960x960/89871353_10222351862565853_5977866908572057600_o.jpg?_nc_cat=111&_nc_sid=13bebb&_nc_eui2=AeFrIbVeohS-UJeYG2jPA9vYRN0P75ywm0dE3Q_vnLCbR3mZMz9aobm7VrTo2dS88h4&_nc_ohc=GwdqvWlEUcYAX8yjNhB&_nc_ht=scontent.fctg1-1.fna&_nc_tp=7&oh=a3fd6afeb885da72bbdbb175c6f3826f&oe=5F32F0D3'),
              radius: 25.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 14.0),
            child: CircleAvatar(
              child: Text('M'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://scontent.fctg1-2.fna.fbcdn.net/v/t1.0-9/11898673_10207570013868874_2282759231660890521_n.jpg?_nc_cat=106&_nc_sid=43edb5&_nc_eui2=AeE9-rKi0W0j1RqCF1oNNgAQ2TIB4as3rFDZMgHhqzesUBE0ZVXiF0NE0MTSrEWTG1c&_nc_ohc=agTNRY4bl8EAX-vbIvp&_nc_ht=scontent.fctg1-2.fna&oh=82a537c5137fad42f9659861ddc2b1fd&oe=5F345190'),
          //mientras este cargando el imagen http me muestre el gif de cargando
          placeholder: AssetImage('assets/loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
