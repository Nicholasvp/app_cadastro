import 'package:app_cadastro/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../routes/app_routes.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl.isEmpty
        ? const CircleAvatar(
            child: Icon(Icons.person),
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(user.avatarUrl),
          );
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.userForm,
                    arguments: user,
                  );
                },
                icon: const Icon(Icons.edit)),
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text('Excluir usuário'),
                          content: const Text('Tem certeza??'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Provider.of<Users>(context, listen: false)
                                      .remove(user);
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Sim')),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Não')),
                          ],
                        ));
              },
              icon: const Icon(Icons.delete),
              color: Colors.red.shade300,
            )
          ],
        ),
      ),
    );
  }
}
