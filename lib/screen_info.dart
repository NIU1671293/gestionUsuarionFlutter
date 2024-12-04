import 'package:flutter/material.dart';

import 'data.dart';

// Parameters
Color iconBackgroundColor = Color(0xFF3A4A6D);
double iconSizes = 70.0;

class ScreenInfo extends StatefulWidget {
  final UserGroup userGroup;

  ScreenInfo({super.key, required this.userGroup});

  @override
  State<ScreenInfo> createState() => _ScreenInfo();
}

class _ScreenInfo extends State<ScreenInfo> {
  final TextEditingController newName = TextEditingController();
  final TextEditingController newDescription = TextEditingController();

  @override
  void initState() {
    super.initState();
    newName.text = widget.userGroup.name;
    newDescription.text = widget.userGroup.description;
  }

  @override
  void dispose() {
    newName.dispose();
    newDescription.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text("Info ${widget.userGroup.name}"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 70),
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              child: TextField(
                controller: newName,
                decoration: const InputDecoration(
                  labelText: "name group",
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              child: TextField(
                controller: newDescription,
                decoration: const InputDecoration(
                  labelText: "description",
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                minLines: 5,
                maxLines: null,
              ),
            ),
            const SizedBox(height: 70),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.userGroup.name = newName.text;
                  widget.userGroup.description = newDescription.text;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Saved')),
                );
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}