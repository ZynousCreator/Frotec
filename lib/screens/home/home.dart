import 'package:frotec/model/mobile_db.dart';
import 'package:frotec/screens/home/components/list_item.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus veiculos"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/new");
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: ListView.separated(
          itemBuilder: (context, index) => ListItem(mobile: mobiles[index]),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: mobiles.length,
        ),
      ),
    );
  }
}
