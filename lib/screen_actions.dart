import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' hide Actions;

import 'data.dart';

class ScreenActions extends StatefulWidget {
  final UserGroup userGroup;

  ScreenActions({super.key, required this.userGroup});

  @override
  State<ScreenActions> createState() => _ScreenActions();
}

class _ScreenActions extends State<ScreenActions> {
  final List<String> title = ["Open", "Close", "Lock", "Unlock", "Unlock shortly"];
  final Map<String, String> description = {
    "open": "opens an unlocked door",
    "close": "closes an open door",
    "lock": "Locks a door or all the doors in a room or group of rooms, if closed",
    "unlock": "Unlocks a locked door or all the locked doors in an room",
    "unlock_shortly": "Unlocks a door during 10 seconds and the locks it if iti is closed",
  };
  final List<String> actions = ["open", "close", "lock", "unlock", "unlock_shortly"];
  late List<bool> isChecked = List.filled(actions.length, false);
  late List<String> localActions;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < actions.length; i++){
      if (widget.userGroup.actions.contains(actions[i])) {
        isChecked[i] = true;
      }
    }
    localActions = List<String>.from(widget.userGroup.actions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text("Actions"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: title.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text(
                    title[index],
                    style: const TextStyle(fontSize: 18),
                  ),
                  subtitle: Text(
                  description.containsKey(actions[index])
                  ? description[actions[index]]!
                  : "Descripción no disponible",
                  style: const TextStyle(fontSize: 14),
                  ),
                  value: isChecked[index],
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked[index] = value ?? false;
                    });
                  },
                );
              },
              separatorBuilder: (BuildContext context,
                  int index) => const Divider(),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  localActions.clear();
                  for (int i = 0; i < isChecked.length; i++){
                    if (isChecked[i]){
                      localActions.add(actions[i]);
                    }
                  }
                  widget.userGroup.actions = List<String>.from(localActions);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Saved')),
                );
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}