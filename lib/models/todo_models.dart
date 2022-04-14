
class Todo {
  int? id;
  final String title;
  bool isChecked;


  //create the constructor
  Todo({this.id, required this.title, required this.isChecked});
// to save this data in database we need to convert it to map
  //make function for that
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isChecked': isChecked ? 1 : 0,
    };
  }
  // this function is for debugging only
  @override
  String toString() {
    return 'Todo(id:$id,title:$title,isChecked:$isChecked)';
  }
}
