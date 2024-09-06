import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:soccer_app/presentation/screens/screens.dart';

class SettingsScreen extends StatelessWidget {

  static const path = '/settings-screen';
  static const name = 'settings-screen';
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Configuraciones'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const ListTile(
              title: Text('Cambiar Tema'),
              subtitle: Text('Cambia del tema de la aplicacion a oscuro o claro'),
              trailing: Icon(Icons.dark_mode),
            ),
            ListTile(
              onTap: (){
                context.pushNamed(ChangeLanguage.name);
              },
              title: const Text('Cambiar lenguage'),
              subtitle: const Text('Escoge el lenguage que desees utilizar en la aplicacion'),
              trailing: const Icon(Icons.language_outlined),
            )
          ],
        ),
      ),
    );
  }
}