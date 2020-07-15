import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Mario'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _checkBox() {
    // return Checkbox(
    //     value: _bloquearCheck,
    //     onChanged: (valor) {
    //       setState(() {
    //         _bloquearCheck = valor;
    //       });
    //     });
    return CheckboxListTile(
        title: Text('Bloquear slider'),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor;
          });
        });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text('Bloquear slider'),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor;
          });
        });
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      divisions: 20,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      //hago una condicion si el _bloquearCheck es verdadero nos devuelva un null y nos bloquee si no que funcione normalmente
      onChanged: (_bloquearCheck)
          ? null
          : (valor) {
              setState(() {
                // print(valor);
                _valorSlider = valor;
              });
            },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://scontent.fctg1-1.fna.fbcdn.net/v/t1.0-9/10532756_10205329643496340_6263896726085464423_n.jpg?_nc_cat=104&_nc_sid=7aed08&_nc_eui2=AeE0zG71dyFh_uaYCiUSVzAgSjOP1XI5q-VKM4_Vcjmr5a5pCCW_gEIy2VkNRRDUSY0&_nc_ohc=pG9jxgPhsM0AX_7Uk6j&_nc_ht=scontent.fctg1-1.fna&oh=84e6afad1ae561c0eff5b75e73ca3d27&oe=5F341836'),
      width: _valorSlider,
      //PARA QUE LA IMAGEN SE ADAPTE
      fit: BoxFit.contain,
    );
  }
}
