import 'package:flutter/material.dart';

import 'model/product_model.dart';
import 'services/api.dart';

class EditScreen extends StatefulWidget {
  final ProductModel data;
  const EditScreen({super.key, required this.data});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController decController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Screen'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          //name controller
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
              controller: nameController,
            ),
          ),
          const SizedBox(height: 10),

          //price controller

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(),
              ),
              controller: priceController,
            ),
          ),

          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              controller: decController,
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blueAccent),
                  foregroundColor: const WidgetStatePropertyAll(Colors.white)),
              onPressed: () {
                //todo update button
                Api.updateProductApi(widget.data.id, {
                  'pname': nameController.text,
                  'pprice': priceController.text,
                  'pdesc': decController.text,
                  'id': widget.data.id
                });
              },
              child: const Text('Update Button'))
        ],
      ),
    );
  }
}
