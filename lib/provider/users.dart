import 'dart:math';

import 'package:app_cadastro/data/dummy_user.dart';
import 'package:app_cadastro/models/user.dart';
import 'package:flutter/material.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...dummyUser};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int index) {
    return _items.values.elementAt(index);
  }

  void put(User user) {
    if (user == null) {
      return;
    }

    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _items.containsKey(user.id)) {
      _items.update(
          user.id,
          (_) => User(
              id: user.id,
              name: user.name,
              email: user.email,
              avatarUrl: user.avatarUrl));
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        '10',
        () => User(
          id: id,
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
        ),
      );
    }

    notifyListeners();
  }

  void remove(User user) {
    if (user != null && user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}
