class StudentModel {
  int? id;
  String? name;
  int? payment;
  int? paymentDate;
  int? days;
  int? fixedPayment;
  int? dateId;
  int? addedDate;

  StudentModel(
      {this.id,
      this.name,
      this.payment,
      this.paymentDate,
      this.days,
      this.fixedPayment,
      this.dateId,
      this.addedDate});

  StudentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    payment = json['payment'];
    paymentDate = json['payment_date'];
    days = json['days'];
    fixedPayment = json['fixedPayment'];
    dateId = json['date_id'];
    addedDate = json['added_date'];
  }

  Map<String, dynamic> toJson({bool? isDeleted}) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['payment'] = this.payment;
    data['payment_date'] = this.paymentDate;
    data['days'] = this.days;
    data['fixedPayment'] = this.fixedPayment;
    data['date_id'] = this.dateId;
    data['added_date'] = this.addedDate;
    if (isDeleted ?? false) {
      data['deleted_date'] = DateTime.now().millisecondsSinceEpoch;
    }
    return data;
  }
}
