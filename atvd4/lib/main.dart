import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação Bancária',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormularioScreen(),
    );
  }
}

//-----------------------------------------------------------------

class FormularioScreen extends StatefulWidget {
  @override
  _FormularioScreenState createState() => _FormularioScreenState();
}

class _FormularioScreenState extends State<FormularioScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _saldoController = TextEditingController();

  List<Map<String, String>> contas = [];

  void _adicionarOuAtualizarConta(int? index) {
    if (_formKey.currentState!.validate()) {
      setState(() {
        if (index == null) {
          contas.add({
            'nome': _nomeController.text,
            'saldo': _saldoController.text,
          });
        } else {
          contas[index] = {
            'nome': _nomeController.text,
            'saldo': _saldoController.text,
          };
        }
        _nomeController.clear();
        _saldoController.clear();
      });
    }
  }

  void _navegarParaLista() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListaScreen(contas: contas, onUpdate: _atualizarConta, onDelete: _deletarConta),
      ),
    );
  }

  void _atualizarConta(int index) {
    _nomeController.text = contas[index]['nome']!;
    _saldoController.text = contas[index]['saldo']!;
    _adicionarOuAtualizarConta(index);
  }

  void _deletarConta(int index) {
    setState(() {
      contas.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar/Atualizar Conta'),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _navegarParaLista,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome da Conta'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _saldoController,
                decoration: InputDecoration(labelText: 'Saldo Inicial'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um saldo';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _adicionarOuAtualizarConta(null),
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//-----------------------------------------------------------------

class ListaScreen extends StatelessWidget {
  final List<Map<String, String>> contas;
  final Function(int) onUpdate;
  final Function(int) onDelete;

  ListaScreen({required this.contas, required this.onUpdate, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Contas'),
      ),
      body: ListView.builder(
        itemCount: contas.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(contas[index]['nome']!),
              subtitle: Text('Saldo: ${contas[index]['saldo']}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.pop(context);
                      onUpdate(index);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      onDelete(index);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
