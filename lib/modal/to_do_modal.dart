class TodoModel {
  String? title,details;

  TodoModel({this.title, this.details});

  factory TodoModel.fromMap(Map m1){
    TodoModel t1 =TodoModel(
      title: m1['Title'],
      details: m1['Details'],
    );
    return t1;
  }
}