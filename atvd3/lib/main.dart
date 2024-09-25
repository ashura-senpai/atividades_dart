import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulário com ListView Dinâmico',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormularioScreen(),
    );
  }
}

class FormularioScreen extends StatefulWidget {
  @override
  _FormularioScreenState createState() => _FormularioScreenState();
}

class _FormularioScreenState extends State<FormularioScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  List<String> _nomes = [];

  void _adicionarNome() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _nomes.add(_nomeController.text);
        _nomeController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário e ListView'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Digite um nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um nome';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _adicionarNome,
              child: Text('Adicionar Nome'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _nomes.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_nomes[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
