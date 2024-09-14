import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Page'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Perforeming crud opreation on these buttons using node js for backend and mongodb for database',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
              onPressed: () {
                // TODO: Implement create functionality
              },
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blueAccent),
                  foregroundColor: WidgetStatePropertyAll(Colors.white)),
              child: const Text(
                'Create',
              )),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement read functionality
            },
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blueAccent),
                foregroundColor: WidgetStatePropertyAll(Colors.white)),
            child: const Text('Read'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                // TODO: Implement update functionality
              },
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blueAccent),
                  foregroundColor: WidgetStatePropertyAll(Colors.white)),
              child: const Text('Update')),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                // TODO: Implement delete functionality
              },
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blueAccent),
                  foregroundColor: WidgetStatePropertyAll(Colors.white)),
              child: const Text('Delete'))
        ],
      ),
    );
  }
}
