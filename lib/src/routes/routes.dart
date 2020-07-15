import 'package:componentesmac/src/pages/listview_page.dart';
import 'package:componentesmac/src/pages/slider_page.dart';
import 'package:flutter/material.dart';

import 'package:componentesmac/src/pages/alert_page.dart';
import 'package:componentesmac/src/pages/avatar_page.dart';
import 'package:componentesmac/src/pages/home_page.dart';
import 'package:componentesmac/src/pages/card_page.dart';
import 'package:componentesmac/src/pages/animate_container.dart';
import 'package:componentesmac/src/pages/input_page.dart';

//retorno en un mapa todas las rutas de mi aplications
Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    AvatarPage.PageName: (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimatePage(),
    'inputs': (BuildContext context) => InputPage(),
    'slider': (BuildContext context) => SliderPage(),
    'list': (BuildContext context) => ListaPage()
  };
}
