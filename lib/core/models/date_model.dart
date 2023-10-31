import 'package:hive_flutter/hive_flutter.dart';
import 'package:manage_finance/core/models/student_model.dart';
import 'package:manage_finance/core/models/teacher_model.dart';

part 'date_model.g.dart';

@HiveType(typeId: 2)
class DateModel {
  @HiveField(0)
  final String date;
  @HiveField(1)
  final List<StudentModel> listStudents;
  @HiveField(2)
  final List<TeacherModel> listTeachers;
  DateModel({
    required this.date,
    required this.listStudents,
    required this.listTeachers,
  });
}
