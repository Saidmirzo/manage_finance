class StudentModel {
  int? id;
  String? name;
  int? payment;
  String? paymentDate;
  int? days;
  int? dateId;

  StudentModel(
      {this.id,
      this.name,
      this.payment,
      this.paymentDate,
      this.days,
      this.dateId});

  StudentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    payment = json['payment'];
    paymentDate = json['payment_date'];
    days = json['days'];
    dateId = json['date_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['payment'] = this.payment;
    data['payment_date'] = this.paymentDate;
    data['days'] = this.days;
    data['date_id'] = this.dateId;
    return data;
  }
}
