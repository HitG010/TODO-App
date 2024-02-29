import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;
  // final void Function(BuildContext)? editFunction;

  const ToDoTile({
    super.key,
    required this.onChanged,
    required this.taskCompleted,
    required this.taskName,
    required this.deleteFunction,
    // required this.editFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 22,
        right: 22,
        top: 15,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(23),
            ),
            // SlidableAction(
            //   onPressed: editFunction,
            //   icon: Icons.edit,
            //   backgroundColor: Colors.blue,
            //   borderRadius: BorderRadius.circular(23),
            // ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.only(
            top: 18,
            bottom: 18,
            left: 15,
            right: 15,
          ),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(93, 128, 127, 1),
            borderRadius: BorderRadius.circular(10),
            // border: Border(
            //   top: BorderSide(
            //     width: 4,
            //     color: Color.fromRGBO(76, 81, 109, 1),
            //     strokeAlign: BorderSide.strokeAlignInside,
            //   ),
            //   bottom: BorderSide(
            //     width: 4,
            //     color: Color.fromRGBO(76, 81, 109, 1),
            //     strokeAlign: BorderSide.strokeAlignInside,
            //   ),
            // ),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                taskName,
                style: TextStyle(
                  fontSize: 20,
                  decoration: (taskCompleted == true) ? TextDecoration.lineThrough : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
