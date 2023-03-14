import 'package:flutter/material.dart';

class NewMobile extends StatefulWidget {
  const NewMobile({super.key});

  @override
  State<NewMobile> createState() => _NewMobileState();
}

class _NewMobileState extends State<NewMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Novo contato"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.camera_alt),
                iconSize: 100,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
