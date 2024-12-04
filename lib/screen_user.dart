import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'data.dart';

class ScreenUser extends StatefulWidget {
  final User user;
  final UserGroup userGroup;

  ScreenUser({super.key, required this.user, required this.userGroup});

  @override
  State<ScreenUser> createState() => _ScreenUser();
}

class _ScreenUser extends State<ScreenUser> {
  final TextEditingController newName = TextEditingController();
  final TextEditingController newCredential = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String? pickedImagePath;
  String? oldImagePath;

  void _showWarning(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Name invalid"),
          content: const Text('The name cannot be used because is repeat or "New User".\nPlease enter a valid name.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: Text("Accept"),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    newName.text = widget.user.name;
    newCredential.text = widget.user.credential;
    oldImagePath = Data.images[widget.user.name.toLowerCase()];
  }

  @override
  void dispose() {
    newName.dispose();
    newCredential.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        pickedImagePath = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      title: const Text("User"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                foregroundImage: () {
                  if (pickedImagePath != null) {
                    return FileImage(File(pickedImagePath!)) as ImageProvider;
                  } else {
                    if (Data.images.containsKey(widget.user.name.toLowerCase())) {
                      return FileImage(File(Data.images[widget.user.name.toLowerCase()]!)) as ImageProvider;
                    } else {
                      return null;
                    }
                  }
                }(),
                radius: 110.0,
                child: () {
                  if (pickedImagePath == null && !Data.images.containsKey(widget.user.name.toLowerCase())) {
                    return Icon(
                      Icons.person,
                      size: 80,
                      color: Colors.grey,
                    );
                  } else {
                    return null;
                  }
                }(),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              child: TextField(
                controller: newName,
                decoration: const InputDecoration(
                  labelText: "name",
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              child: TextField(
                controller: newCredential,
                decoration: const InputDecoration(
                  labelText: "credential",
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
            ),
            const SizedBox(height: 70),
            ElevatedButton(
              onPressed: () {
                print(newName.text);
                if (newName.text.toLowerCase() == "new user" || Data.images.containsKey(newName.text.toLowerCase())){
                  _showWarning(context);
                } else {
                  setState(() {
                    String oldName = widget.user.name;
                    widget.user.name = newName.text;
                    widget.user.credential = newCredential.text;
                    widget.userGroup.users.add(widget.user);
                    if (oldName != widget.user.name) {
                      String? imagePath = Data.images.remove(oldName.toLowerCase());
                      if (imagePath != null) {
                        Data.images[widget.user.name.toLowerCase()] = imagePath;
                      }
                    }
                    if (pickedImagePath != null) {
                      Data.images[widget.user.name.toLowerCase()] = pickedImagePath!;
                    }
                    if (!Data.images.containsKey("new user")){
                      Data.images["new user"] = "faces/new_user.png";
                    }
                    print(Data.images);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Saved')),
                  );
                }
              },
              child: const Text("Submit"),
            ),
          ],
        )
      )
    );
  }
}