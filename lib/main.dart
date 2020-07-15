import 'package:componentesmac/src/routes/routes.dart';
import 'package:flutter/material.dart';
//paquete de los lenguajes que soporta mi apk
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:componentesmac/src/pages/alert_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes app',
      //para quitar el debug de proueba
      debugShowCheckedModeBanner: false,
      //lenguajes que soporta mi apk
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English, no country code
        const Locale('es', 'ES'), // Hebrew, no country code
        // ... other locales the app supports
      ],
      //  home: HomePage()
      initialRoute: '/',
      //expotto mi metodo donde tengo todas mis rutas
      routes: getAplicationRoutes(),
      //si presiono en una ruta que no existe nos manda para alert
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
    );
  }
}
