import 'package:agenda_de_contatos/model/DAO/contact_dao.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

import 'package:agenda_de_contatos/model/contact.dart';
import 'package:agenda_de_contatos/screens/new_contact/components/custom_textformfield.dart';

class NewContact extends StatefulWidget {
  const NewContact({super.key});

  @override
  State<NewContact> createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {
  var nameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController =
      MaskedTextController(mask: "+00 00 00000-0000", text: "+55 ");
  final _formKey = GlobalKey<FormState>();
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Novo veículo"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            var contact = Contact(
              marca: nameController.text,
              plate: lastNameController.text,
              isFavorite: _isFavorite,
            );
            int result = await ContactDAO.insert(contact.toMap());
            SnackBar snack;
            if (result != 0) {
              snack = const SnackBar(
                content: Text("Contato cadastrado com sucesso!!!"),
                backgroundColor: Colors.green,
              );
            } else {
              snack = const SnackBar(
                content: Text("Não foi possível cadastrar o contato!!!"),
                backgroundColor: Colors.orange,
              );
            }
            ScaffoldMessenger.of(context).showSnackBar(snack);
          }
        },
        child: const Icon(Icons.save),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // IconButton(
                //   icon: const Icon(Icons.camera_alt),
                //   iconSize: 100,
                //   color: Theme.of(context).colorScheme.primary,
                //   onPressed: () {},
                // ),
                CustomTextFormField(
                  label: "Marca",
                  controller: nameController,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "A marca não pode ficar em branco";
                    } else if (value != null && value.length < 8) {
                      return "O campo deve possuir ao menos 8 caracteres";
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  label: "Placa",
                  controller: lastNameController,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "A placa não pode ficar em branco";
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Switch(
                      onChanged: (value) {
                        setState(() {
                          _isFavorite = value;
                        });
                      },
                      value: _isFavorite,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
