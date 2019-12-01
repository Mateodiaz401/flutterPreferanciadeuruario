import 'package:flutter/material.dart';
import 'package:preferenciausuarioapp/src/share_prefs/preferencia_usuario.dart';
import 'package:preferenciausuarioapp/src/widgets/menu_widgets.dart';

class HomePage extends StatelessWidget {
  
  static final String routeName = 'home';
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {

    prefs.ultimaPagina = HomePage.routeName;
    return Scaffold(
      appBar: AppBar(
        title: Text('Prferencias de Usuario'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.orangeAccent,
      ),
      drawer: MenuWidgets(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario: ${ prefs.colorSecundario}'),
          Divider(),
          Text('Genero: ${prefs.genero}'),
          Divider(),
          Text('Nombre Usuario: ${prefs.nombreUsuario}'),
          Divider(),
        ],
      ),
    );
  }
}