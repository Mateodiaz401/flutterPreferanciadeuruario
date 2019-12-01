import 'package:flutter/material.dart';
import 'package:preferenciausuarioapp/src/widgets/menu_widgets.dart';
import 'package:preferenciausuarioapp/src/share_prefs/preferencia_usuario.dart';

class SettingsPage extends StatefulWidget {
  
  static final String routeName = 'setings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario;
  int _genero;
  String _nombre = 'Pedro';

  TextEditingController _textController;

  final prefs = new PreferenciasUsuario();

  @override
  void initState(){ 
    super.initState();
    prefs.ultimaPagina = SettingsPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;

    _textController =new TextEditingController(text: prefs.nombreUsuario);  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajuste'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.orangeAccent,
      ),
      drawer: MenuWidgets(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Ajustes', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color segundario'),
            onChanged: (value){
              setState(() {
                _colorSecundario = value;
                prefs.colorSecundario = value;
              });
            },
          ),
          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: _nombre,
                helperText: 'Nombre del dueño del telefono',
              ),
              onChanged: (value){
                prefs.nombreUsuario =  value;
              },
            ),
          )
        ],
      )
    );
  }

  _setSelectedRadio (int valor){
    // prefs.setInt('genero', valor);
    prefs.genero = valor;
    _genero = valor;
    setState(() {
    });
  }
}