import 'package:flutter/material.dart';
import 'package:todo_app/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromRGBO(93, 128, 127, 1),
      content: SizedBox(
        height: 120,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 8,
            ),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new Task",
                hintStyle: TextStyle(
                  color: Colors.black26,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //save button
              MyButton(
                text: "Save",
                onPressed: onSave,
              ),

              const SizedBox(
                width: 8,
              ),
              //cancel button
              MyButton(
                text: "Cancel",
                onPressed: onCancel,
              )
            ],
          ),
        ]),
      ),
    );
  }
}

class DialogBox2 extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final String old;

  const DialogBox2({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    required this.old,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromRGBO(93, 128, 127, 1),
      content: SizedBox(
        height: 120,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 8,
            ),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //save button
              MyButton(
                text: "Save",
                onPressed: onSave,
              ),

              const SizedBox(
                width: 8,
              ),
              //cancel button
              MyButton(
                text: "Cancel",
                onPressed: onCancel,
              )
            ],
          ),
        ]),
      ),
    );
  }
}
