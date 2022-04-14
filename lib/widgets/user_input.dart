import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_models.dart';

class UserInput extends StatelessWidget {
  final textController = TextEditingController();
  final Function insertFunction;
  UserInput({ required this.insertFunction, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      color: Colors.white,

      child: Row(
        children: [
          // it is in put box
          Expanded(
              child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
            child: TextField(
              controller: textController,
              decoration:const InputDecoration(
                  borderSide: BorderSide(color: Colors.lightBlue, width: 3.0),
                ),
              ),
            ),
          ),
          const SizedBox(width: 18),
          // this is button
          GestureDetector(
            onTap: () {
              var myTodo = Todo(
                  title:textController.text,
              isChecked: false);
              //  pass this to the insertfunction  as paramater
              insertFunction(myTodo);

            },
            child: Container(
                color: Colors.black,
                margin:const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                  child: new IconTheme(
                    data: new IconThemeData(
                        color: Colors.white),
                    child: new Icon(Icons.add,),
                  ),)),

        ],
      ),
    );
  }
}
