import 'package:app_cadastro/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  UserForm({Key? key}) : super(key: key);
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário'),
        actions: [
          IconButton(
              onPressed: () {
                final isValid = _form.currentState!.validate();
                if (isValid) {
                  _form.currentState!.save();
                  Provider.of<dynamic>(context, listen: false).put(User(
                    id: _formData['id']!,
                    name: _formData['name']!,
                    email: _formData['email']!,
                    avatarUrl: _formData['avatarURL']!,
                  ));
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
              decoration: const InputDecoration(
                labelText: 'Nome',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Preencha esse campo';
                }
                ;
              },
              onSaved: (value) => _formData['name'] = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              onSaved: (value) => _formData['email'] = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'URL do Avatar',
              ),
              onSaved: (value) => _formData['avartarURL'] = value!,
            ),
          ]),
        ),
      ),
    );
  }
}
