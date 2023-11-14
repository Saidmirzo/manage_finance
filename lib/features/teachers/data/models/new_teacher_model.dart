class NewTeacherModel {
  String? name;
  String? subjectName;
  int? dateId;
  int? fees;

  NewTeacherModel({this.name, this.subjectName, this.dateId, this.fees});

  NewTeacherModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    subjectName = json['subject_name'];
    dateId = json['date_id'];
    fees = json['fees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['subject_name'] = this.subjectName;
    data['date_id'] = this.dateId;
    data['fees'] = this.fees;
    return data;
  }
}
