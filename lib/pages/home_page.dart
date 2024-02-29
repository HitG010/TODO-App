import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/util/dialog_box.dart';
import 'package:todo_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('mybox');

  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if this is the first time ever opening, then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  // save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([
        _controller.text,
        false,
      ]);
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  //Create a new task
  void creatNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  // void editTask(int index) {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return DialogBox2(
  //           controller: _controller,
  //           onSave: saveOldTask(index),
  //           onCancel: () => Navigator.of(context).pop(),
  //           old: toDoList[index][0],
  //         );
  //       });
  // }

  // dynamic saveOldTask(int index) {
  //   setState(() {
  //     toDoList[index][0] = _controller.text;
  //   });
  //   Navigator.of(context).pop();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(12, 19, 46, 1),
      appBar: AppBar(
        title: const Text(
          "TO DO",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        backgroundColor: const Color.fromRGBO(76, 81, 109, 1),
        elevation: 25,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          creatNewTask();
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskCompleted: db.toDoList[index][1],
            taskName: db.toDoList[index][0],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
            // editFunction: (context) => editTask(index),
          );
        },
      ),
    );
  }
}
