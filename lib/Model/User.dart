class User{
  int? id;
  String? title;
  String? body;

  User({
    this.id,
    this.title,
    this.body
  });

  User.fromJson(Map<String,dynamic> json){
    id=json["id"];
    title=json["title"];
    body=json["body"];
  }


}