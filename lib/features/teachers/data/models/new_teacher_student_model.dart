class NewStudentModel {
  int? id;
  String? name;
  int? inLesson;

  NewStudentModel({this.id, this.name, this.inLesson});

  NewStudentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    inLesson = json['inLesson'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['inLesson'] = this.inLesson;
    return data;
  }
}
