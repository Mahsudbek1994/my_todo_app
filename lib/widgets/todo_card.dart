import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_models.dart';

// ignore: must_be_immutable
class Todocard extends StatefulWidget {
  // make variables  that todo will receive data for
  final int id;
  final String title;
  bool isChecked;
  final Function insertFunction;
  final Function deleteFunction;

  Todocard(
      {required this.id,
      required this.title,
      required this.isChecked,
      required this.insertFunction, //this  wil handle the changes in checkbox
      required this.deleteFunction, // this will handle the delete button function
      Key? key})
      : super(key: key);

  @override
  State<Todocard> createState() => _TodocardState();
}

class _TodocardState extends State<Todocard> {
  @override
  Widget build(BuildContext context) {
    //create a local todo
    var anotherTodo =
        Todo(id: widget.id, title: widget.title, isChecked: widget.isChecked);

    return Card(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.grey.shade100,
            border: Border.all(color: Colors.grey.shade200)),
        child: Row(
          children: [
            // this a check box
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Checkbox(
                value: widget.isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    widget.isChecked = value!;
                  });
                  // change the value  of  another todo's is check
                  anotherTodo.isChecked = value!;
                  // insert it to database
                  widget.insertFunction(anotherTodo);
                },
              ),
            ),
            //this is title and date
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
            // this is delete button
            IconButton(
                onPressed: () {
                  //  delete method
                  widget.deleteFunction(anotherTodo);
                },
                icon: const Icon(Icons.close)),
          ],
        ),
      ),
    );
  }
}
