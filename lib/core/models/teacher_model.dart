import 'package:hive_flutter/hive_flutter.dart';
import 'package:manage_finance/core/models/student_model.dart';
part 'teacher_model.g.dart';

@HiveType(typeId: 1)
class TeacherModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final List<StudentModel>? students;
  @HiveField(3)
  final double fees;
  @HiveField(4)
  final String subjectName;

  TeacherModel({
    this.students,
    required this.id,
    required this.name,
    required this.fees,
    required this.subjectName,
  });
}
