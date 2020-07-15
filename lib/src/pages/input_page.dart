import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  //declaro la variable del nombre
  String _nombre = '';
  String _email = '';
  String _passwordd = '';
  String _fecha = '';
  String _opcionSelecionada = 'Unicor';

  List _listaSelect = [
    'Unicor',
    'Unisucre',
    'UPB',
    'Unisiu',
    'Corposucre',
    'Cecar'
  ];
  //NOS PERMITE MANEJAR LA CAJA DE LA FECHA
  TextEditingController _inputControllerFecha = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('input de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearSelectDropdown(),
          _crearPersona()
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      //para que se posecione
      //  autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          //    counter: Text('Letras ${_nombre.length}'),
          hintText: 'Nombre de la persona',
          labelText: 'Nombre',
          helperText: 'solo es el nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      //le paso el valor que digito en el input y lo paso por parametro
      onChanged: (valor) {
        //si quiero que se vea en tiempo real
        setState(() {
          _nombre = valor;
          //  print(_nombre);
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      //para que se posecione
      //  autofocus: true,
      keyboardType: TextInputType.emailAddress,

      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Email',
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      //le paso el valor que digito en el input y lo paso por parametro
      onChanged: (valor) {
        //si quiero que se vea en tiempo real
        setState(() {
          _email = valor;
          //  print(_nombre);
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      //para que se posecione
      //  obscureText para que me oculto lo que voy escribiendo
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Password',
          labelText: 'Password',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock)),
      //le paso el valor que digito en el input y lo paso por parametro
      onChanged: (valor) {
        //si quiero que se vea en tiempo real
        setState(() {
          _passwordd = valor;
          //  print(_nombre);
        });
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
        enableInteractiveSelection: false,
        controller: _inputControllerFecha,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Fecha de nacimiento',
            labelText: 'Fecha de nacimiento',
            suffixIcon: Icon(Icons.perm_contact_calendar),
            icon: Icon(Icons.calendar_today)),

        //para que me dispare el calendario de las fechas
        onTap: () {
          //quitar el foco
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        });
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2020),
      lastDate: new DateTime(2025),
    );
    //hacemos una validacion para saber si la persona escogio alguna fecha
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        //le paso el valor al controlador de la fecha
        _inputControllerFecha.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = new List();
    _listaSelect.forEach((seleccionando) {
      lista.add(DropdownMenuItem(
        child: Text(seleccionando),
        value: seleccionando,
      ));
    });

    return lista;
  }

  Widget _crearSelectDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
          child: DropdownButton(
              value: _opcionSelecionada,
              items: getOpcionesDropdown(),
              onChanged: (opt) {
                // print(opt);
                // para que me lo dibuje el valor que seleccione
                setState(() {
                  _opcionSelecionada = opt;
                });
              }),
        )
      ],
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email:$_email '),
      trailing: Text(_opcionSelecionada),
    );
  }
}
