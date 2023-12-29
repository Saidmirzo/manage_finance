class NewTeacherModel {
  String? name;
  String? subjectName;
  int? fees;

  NewTeacherModel({this.name, this.subjectName,  this.fees});

  NewTeacherModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    subjectName = json['subject_name'];
    fees = json['fees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['subject_name'] = this.subjectName;
    data['fees'] = this.fees;
    return data;
  }
}
