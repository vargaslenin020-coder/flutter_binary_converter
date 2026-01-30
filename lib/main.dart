import 'package:flutter/material.dart';

void main() => runApp(const BinaryConverterApp());

class BinaryConverterApp extends StatelessWidget {
  const BinaryConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ConverterScreen(),
    );
  }
}

class ConverterScreen extends StatefulWidget {
  @override
  _ConverterScreenState createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  final TextEditingController _controller = TextEditingController();
  String _result = "0";

  void _convertToBinary() {
    setState(() {
      int? decimalValue = int.tryParse(_controller.text);
      if (decimalValue != null) {
        // La magia ocurre aquí
        _result = decimalValue.toRadixString(2);
      } else {
        _result = "Número inválido";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Convertidor Decimal a Binario')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Ingrese número decimal',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertToBinary,
              child: const Text('Convertir'),
            ),
            const SizedBox(height: 30),
            Text('Resultado Binario:', style: TextStyle(fontSize: 18)),
            SelectableText(
              _result,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}

