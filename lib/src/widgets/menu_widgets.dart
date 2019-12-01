import 'package:flutter/material.dart';
import 'package:preferenciausuarioapp/src/pages/home_page.dart';
import 'package:preferenciausuarioapp/src/pages/settings_page.dart';

class MenuWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image:DecorationImage(image: AssetImage('assets/menu-img.jpg'),
              fit: BoxFit.cover),
            ),
          ),
          ListTile(
            leading:  Icon(Icons.pages, color:Colors.blue),
            title: Text('Home'),
            onTap: () => Navigator.pushNamed(context, HomePage.routeName),
          ),
          ListTile(
            leading:  Icon(Icons.party_mode, color:Colors.blue),
            title: Text('Party mode'),
            onTap: (){},
          ),
          ListTile(
            leading:  Icon(Icons.person, color:Colors.blue),
            title: Text('Person'),
            onTap: (){},
          ),
          ListTile(
            leading:  Icon(Icons.settings, color:Colors.blue),
            title: Text('Ajustes'),
            //push pushNamed tiene la misma funcion que el pushReplacementNamed
            onTap: (){
               Navigator.pushReplacementNamed(context, SettingsPage.routeName);
            }
          ),
        ],
      ),
    );
  }
}