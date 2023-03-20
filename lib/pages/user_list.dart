import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/user_tile.dart';
import '../provider/users.dart';
import '../routes/app_routes.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de usuários'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (context, index) => UserTile(user: users.byIndex(index)),
      ),
    );
  }
}
