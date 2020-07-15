import 'package:flutter/material.dart';

//definimos un mapa
final _icons = <String, IconData>{
  'accessibility': Icons.accessibility,
  'add_alert': Icons.add_alert,
  'folder_open': Icons.folder_open,
  'donut_large': Icons.donut_large,
  'input': Icons.input,
  'slider': Icons.list,
  'list': Icons.list,
};
//metodo para mandar el icono segun el nombre que mande
Icon getIcon(String nombreIcono) {
  return Icon(_icons[nombreIcono], color: Colors.blue);
}
