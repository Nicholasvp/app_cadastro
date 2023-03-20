import 'package:flutter/material.dart';

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
                    AppRoutes.USER_FORM,
                    arguments: user,
                  );
                },
                icon: const Icon(Icons.edit)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
              color: Colors.red.shade300,
            )
          ],
        ),
      ),
    );
  }
}
