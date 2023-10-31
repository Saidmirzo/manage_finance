import 'package:hive_flutter/hive_flutter.dart';
part 'student_model.g.dart';

@HiveType(typeId: 0)
class StudentModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int payment;
  @HiveField(3)
  final int paymentDate;
  @HiveField(4)
  final int days;

  StudentModel({
    required this.payment,
    required this.paymentDate,
    required this.id,
    required this.name,
     this.days=30,
  });
}
