import 'dart:math';

import 'package:flutter/material.dart';

class AnimatePage extends StatefulWidget {
  @override
  _AnimatePageState createState() => _AnimatePageState();
}

class _AnimatePageState extends State<AnimatePage> {
  //creamos algunas propiedades
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animacion container'),
      ),
      body: Center(
        child: AnimatedContainer(
          //efecto de la animacion rapides
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _height,
          decoration: BoxDecoration(borderRadius: _borderRadius, color: _color),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: _cambiarForma,
      ),
    );
  }

  void _cambiarForma() {
    //aleatoria
    final random = Random();

    setState(() {
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromARGB(
          random.nextInt(250), random.nextInt(250), random.nextInt(250), 1);
    });

    _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
  }
}
