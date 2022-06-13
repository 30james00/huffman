import 'package:flutter/material.dart';
import 'package:huffman/application/huffman.dart';

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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Huffman code',
              style: Theme.of(context).textTheme.headline1,
            ),
            Form(
              key: _formKey,
              child: TextFormField(
                controller: formController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter message to encode';
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(
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
            if (huffman != null) Text(huffman!.encoded),
          ],
        ),
      ),
    );
  }
}
