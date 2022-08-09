import 'package:flutter/material.dart';
import 'package:huffman/application/huffman.dart';
import 'package:huffman/presentation/huffman_stats.dart';
import 'package:huffman/presentation/huffman_tree_screen.dart';

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
        child: SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1000),
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
                Row(
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          key: _formKey,
                          child: TextFormField(
                            autofocus: true,
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
                            maxLines: null,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                      child: IconButton(
                        splashRadius: 20,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              huffman = Huffman(formController.text);
                            });
                          }
                        },
                        icon: const Icon(Icons.arrow_forward),
                      ),
                    ),
                  ],
                ),
                if (huffman != null)
                  HuffmanStats(
                    huffman: huffman!,
                    pushGraph: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HuffmanTreeScreen(
                            huffmanHeight: huffman!.height,
                            root: huffman!.root,
                          ),
                        ),
                      ),
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
