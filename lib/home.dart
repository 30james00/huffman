import 'package:flutter/material.dart';
import 'package:huffman/application/huffman.dart';
import 'package:huffman/presentation/huffman_stats.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final formController = TextEditingController();
  Huffman? huffman;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    formController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Huffman code',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                constraints: const BoxConstraints(maxWidth: 800),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: formController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter message to encode';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter message to encode',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Processing Data'),
                        ),
                      );
                      setState(() {
                        huffman = Huffman(formController.text);
                      });
                    }
                  },
                  child: Text(
                    'Encode',
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              ),
              if (huffman != null) HuffmanStats(huffman: huffman!),
            ],
          ),
        ),
      ),
    );
  }
}
