class DateModel {
  int? id;
  int? date;

  DateModel({this.id, this.date});

  DateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['date'] = date;
    return data;
  }
}
