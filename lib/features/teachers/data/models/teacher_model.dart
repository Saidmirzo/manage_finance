class TeacherModel {
  int? id;
  String? subjectName;
  String? name;
  int? fees;
  int? pupils;
  double? payment;

  TeacherModel(
      {this.id,
      this.subjectName,
      this.name,
      this.fees,
      this.pupils,
      this.payment});

  TeacherModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subjectName = json['subject_name'];
    name = json['name'];
    fees = json['fees'];
    pupils = json['pupils'];
    payment = json['payment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['subject_name'] = this.subjectName;
    data['name'] = this.name;
    data['fees'] = this.fees;
    data['pupils'] = this.pupils;
    data['payment'] = this.payment;
    return data;
  }
}
