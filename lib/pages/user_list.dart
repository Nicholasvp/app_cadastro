import 'package:app_cadastro/data/dummy_user.dart';
import 'package:flutter/material.dart';

import '../components/user_tile.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    var users = {...dummyUser};
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de usuários'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) =>
            UserTile(user: users.values.elementAt(index)),
      ),
    );
  }
}
