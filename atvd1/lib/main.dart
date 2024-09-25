import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo de Layout com ListView e Cards'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Usuário 1'),
                subtitle: Text('Descrição do usuário 1'),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Usuário 2'),
                subtitle: Text('Descrição do usuário 2'),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Usuário 3'),
                subtitle: Text('Descrição do usuário 3'),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Usuário 4'),
                subtitle: Text('Descrição do usuário 4'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
