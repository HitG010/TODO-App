import 'package:hive/hive.dart';

class ToDoDataBase {
  List toDoList = [];
  final _myBox = Hive.box('mybox');

  //run this method if the app is opened the first time ever
  void createInitialData() {
    toDoList = [
      [
        "Make Tutorial",
        false
      ],
      [
        "Do Exercise",
        false
      ],
    ];
  }

  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
