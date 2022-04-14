import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_models.dart';

class UserInput extends StatelessWidget {
  final textController = TextEditingController();
  final Function insertFunction;
  UserInput({required this.insertFunction, Key? key}) : super(key: key);

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
                    decoration: const InputDecoration(
                      hintText: "",
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.lightBlue, width: 3.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.lightBlue, width: 3.0),
                      ),
                    ),
                  ))),
          // this is button
          GestureDetector(
              onTap: () {
                var myTodo = Todo(title: textController.text, isChecked: false);

                //  pass this to the insertfunction  as paramater
                insertFunction(myTodo);
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: Colors.black,
                    border: Border.all(color: Colors.black)),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 35,
                ),
                height: 58,
                width: 58,
              )),
        ],
      ),
    );
  }
}
