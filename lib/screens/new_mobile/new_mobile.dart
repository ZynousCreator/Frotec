import 'package:frotec/screens/new_mobile/components/custom_textformfield.dart';
import 'package:flutter/material.dart';

class NewMobile extends StatefulWidget {
  const NewMobile({super.key});

  @override
  State<NewMobile> createState() => _NewMobileState();
}

class _NewMobileState extends State<NewMobile> {
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  // final _phoneController =
  //     MaskedTextController(text: "+", mask: "+00 00 00000-0000");
  bool _isFavorite = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Novo movel"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {}
        },
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
              CustomTextFormField(
                label: "Placa",
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "O campo não pode ficar vazio";
                  } else if (value != null && value.length < 2) {
                    return "O campo deve possuir ao menos 2 caracteres";
                  }
                  return null;
                },
                controller: _nameController,
              ),
              CustomTextFormField(
                label: "Nome do Motorista",
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "O campo não pode ficar vazio";
                  } else if (value != null && value.length < 2) {
                    return "O campo deve possuir ao menos 2 caracteres";
                  }
                  return null;
                },
                controller: _nameController,
              ),
              CustomTextFormField(
                label: "Kilometros",
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "O campo não pode ficar vazio";
                  } else if (value != null && value.length < 2) {
                    return "O campo deve possuir ao menos 2 caracteres";
                  }
                  return null;
                },
                controller: _nameController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
