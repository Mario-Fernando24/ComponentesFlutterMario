import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  //controlador del scrol de la lista lo ultimo
  ScrollController _scrollController = new ScrollController();
  List<int> _listNumeros = new List();
  int _ultimoItem = 0;
  bool _estaCargando = false;

  @override
  //el  initState es un metodo que no regresa nada
  void initState() {
    // TODO: implement initState
    super.initState();
    _agregardiezImagen();

    //se va a disparar cada ves que se mueva el scroll
    _scrollController.addListener(() {
      //si la posicion del scrooll en pixeles es igual a la posicion maxima del scroll
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //_agregardiezImagen();
        //traigo la informacion
        fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ListView'),
        ),
        //Stack los apila uno encima de otros
        body: Stack(
          children: <Widget>[
            _CrearLista(),
            _crearLoading(),
          ],
        ));
  }

  //itemBuilder es el metodo que se encarga de redibujar  los elemento que se encuetra en esta lista
  Widget _CrearLista() {
    return RefreshIndicator(
      onRefresh: () {
        obtenerPagina1();
      },
      child: ListView.builder(
        controller: _scrollController,
        //cuantos elementos tiene esta lista
        itemCount: _listNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listNumeros[index];

          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
            //mientras este cargando el imagen http me muestre el gif de cargando
            placeholder: AssetImage('assets/loading.gif'),
          );
        },
      ),
    );
  }

  Future<Null> obtenerPagina1() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      //borro la lista de numeros
      _listNumeros.clear();
      //sumo uno el ultimo item
      _ultimoItem++;
      _agregardiezImagen();
    });

    return Future.delayed(duration);
  }

  //funcion para agregar los item en la lista para que se muestren 10 imagenes
  _agregardiezImagen() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listNumeros.add(_ultimoItem);
    }

    setState(() {});
  }

  //para que me salga un dato que esta cargando las otras imagenes
  Future<Null> fetchData() async {
    _estaCargando = true;
    setState(() {});
    //le coloco una duracion de 2 segundo y retorno y me llama el metodo respuestaHTTP
    final duration = new Duration(seconds: 2);
    return new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    //ya termino de cargar
    _estaCargando = false;
    _agregardiezImagen();
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));
  }

  //dispara la pagina
  @override
  void dispose() {
    // TODO: implement dispose y prevenir fugaz de memoria
    super.dispose();
    _scrollController.dispose();
  }

  Widget _crearLoading() {
    //si esta cargando es igual a true
    if (_estaCargando) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
          SizedBox(height: 15.0)
        ],
      );
    } else {
      //si no que me mande un cantainer vacio
      return Container();
    }
  }
}
