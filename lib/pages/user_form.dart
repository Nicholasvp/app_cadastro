import 'dart:math';

import 'package:app_cadastro/models/user.dart';
import 'package:app_cadastro/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  UserForm({Key? key}) : super(key: key);
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(User user) {
    _formData['id'] = user.id;
    _formData['name'] = user.name;
    _formData['email'] = user.email;
    _formData['avatarUrl'] = user.avatarUrl;
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as User;
    print(user.name);

    _loadFormData(user);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário'),
        actions: [
          IconButton(
              onPressed: () {
                final isValid = _form.currentState!.validate();
                if (isValid) {
                  _form.currentState!.save();
                  Provider.of<Users>(context, listen: false).put(
                    User(
                      id: _formData['id'] ?? Random().nextDouble().toString(),
                      name: _formData['name'] ?? '',
                      email: _formData['email'] ?? '',
                      avatarUrl: _formData['avatarUrl'] ?? '',
                    ),
                  );
                  Navigator.of(context).pop();
                }
              },
              icon: const Icon(Icons.turned_in_rounded))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _form,
          child: Column(children: [
            TextFormField(
              initialValue: _formData['name'],
              decoration: const InputDecoration(
                labelText: 'Nome',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Preencha esse campo';
                }
                return null;
              },
              onSaved: (value) => _formData['name'] = value!,
            ),
            TextFormField(
              initialValue: _formData['email'],
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              onSaved: (value) => _formData['email'] = value!,
            ),
            TextFormField(
              initialValue: _formData['avatarUrl'],
              decoration: const InputDecoration(
                labelText: 'URL do Avatar',
              ),
              onSaved: (value) => _formData['avatarUrl'] = value ?? '',
            ),
          ]),
        ),
      ),
    );
  }
}
