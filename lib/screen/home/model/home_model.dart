class DBModel{

  String? title,description,category;
  int? id;
  DBModel({this.title, this.description, this.category,this.id});

  factory DBModel.mapToModel(Map m1){
    return DBModel(
      id: m1['id'],
      title: m1['title'],
      description: m1['description'],
      category: m1['category'],
    );
  }
}