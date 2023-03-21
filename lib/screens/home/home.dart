import 'package:agenda_de_contatos/model/DAO/contact_dao.dart';
import 'package:agenda_de_contatos/model/contact.dart';
import 'package:agenda_de_contatos/screens/home/components/list_item.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<Contact> contacts = [];

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/images/frotecLogo.png"),
        title: const Text("Meus carros"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/new");
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: ContactDAO.findAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none ||
              snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            contacts = snapshot.data!;
            return Container(
              margin: const EdgeInsets.all(16),
              child: RefreshIndicator(
                onRefresh: () async {
                  contacts = await ContactDAO.findAll();
                  setState(() {});
                },
                child: ListView.separated(
                  itemBuilder: (context, index) => ListItem(
                    contact: contacts[index],
                  ),
                  separatorBuilder: (context, _) => const Divider(),
                  itemCount: contacts.length,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
