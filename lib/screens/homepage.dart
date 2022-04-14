import 'package:flutter/material.dart';
import 'package:todo_app/models/db_models.dart';
import 'package:todo_app/models/todo_models.dart';
import '../widgets/user_input.dart';
import '../widgets/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // it is function where  two widgets can communicate

  // we can access darabse functions
  var db = DatabaseConnect();

  //function to add todo
  void addItem(Todo todo) async {
    await db.insertTodo(todo);
    setState(() {});
  }

  // function delete todo
  void deleteItem(Todo todo) async {
    await db.deleteTodo(todo);
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.yellow[600],
        title: const Center(
          child: Text(
            'Qaydnoma',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(children: [
        //we wil add our widgets here
        Todolist(
          insertFunction: addItem,
          deleteFunction: deleteItem,
        ),
        UserInput(
          insertFunction: addItem,
        ),
      ]),
    );
  }
}
