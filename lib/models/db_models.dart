import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_app/models/todo_models.dart';


class DatabaseConnect{
  Database? _database;
  //make  a getter  and a connectioin to database
  Future<Database> get database async{
    // it is  the location of our database in device
    final dbpath = await getDatabasesPath();
    // this is name of our datbase
    const dbname = 'todo.db';
    // this  joins  the dbpath and dbname makes  a flull path for database
    final path = join(dbpath, dbname);
    // open  the connection
    _database = await openDatabase(path, version: 1,onCreate: _createDB);
    // we will create the _currentDB FUNCTION Seperately
    return _database!;

  }
  // the _create db function
  // it makes tables in our database
  Future<void> _createDB(Database db, int version) async{
    // mak sure  the columns we create in our table match the todo_model field
    await db.execute('''
    CREATE TABLE todo(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    isChecked INTEGER
    )
    ''');
  }
  // the function to  add data in our database
  Future<void>insertTodo(Todo todo)async{
    // get the connection to database
    final db = await database;
    // insert the todo
    await db.insert(
      'todo',// the name of  table
      todo.toMap(),conflictAlgorithm: ConflictAlgorithm.replace, // this will  replase  the duplicate entary
    );
  }
  // function to delete a todo  from our database
  Future<void>deleteTodo(Todo todo) async{
  final db = await database;
  // delete  the to do fromdatabse based on its id
  await db.delete('todo',where: 'id == ?',  // this condition will check for id in todo list
    whereArgs: [todo.id],
  );
  }
 // function to fetch  all the todo data from our databa
  Future<List>getTodo() async{
    final db = await database;
    // query to databse and save the todo as list of maps
    List<Map<String,dynamic>> items = await db.query('todo',
        orderBy: 'id DESC', // it will order the list by id in descending order
                            // so  the latest todo will be displeyed on top
      // now convert  the items from list of maps  to list of todo
    );
      return List.generate(
          items.length,
        (i) => Todo(id:items[i]['id'],
            title:items[i]['title'],
          isChecked: items[i]['isChecked'] == 1 ? true:false,
        ),
      );

  }
}