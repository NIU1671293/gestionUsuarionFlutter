import 'dart:io';
import 'package:flutter/material.dart';

import 'data.dart';
import 'screen_user.dart';

class ScreenUsers extends StatefulWidget {
  final UserGroup userGroup;

  ScreenUsers({super.key, required this.userGroup});

  @override
  State<ScreenUsers> createState() => _ScreenUsers();
}

class _ScreenUsers extends State<ScreenUsers> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          User newUser = User(
              "New User",
              "00000");
          Navigator.of(context)
          .push(MaterialPageRoute<void>(builder: (context) => ScreenUser(user: newUser, userGroup: widget.userGroup)),)
          .then((var v) => setState(() {}));
        },
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text("User ${widget.userGroup.name}"),
      ),
      body: ListView.separated(
        // it's like ListView.builder() but better
        // because it includes a separator between items
        padding: const EdgeInsets.all(16.0),
        itemCount: widget.userGroup.users.length,
        itemBuilder: (BuildContext context, int index) =>
            _buildRow(widget.userGroup.users[index], index),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }

  Widget _buildRow(User user, int index) {
    return ListTile(
      leading: CircleAvatar(foregroundImage:
        FileImage(File(Data.images[user.name.toLowerCase()]!)) as ImageProvider),
      title: Text(user.name),
      trailing: Text("${user.credential}"),
      onTap: () => Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (context) => ScreenUser(user: user, userGroup: widget.userGroup)),
        )
        .then((var v) => setState(() {}))
    );
  }
}