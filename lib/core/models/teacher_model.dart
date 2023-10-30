import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 1)
class TeacherModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final List<int>? students;
  TeacherModel({
    this.students,
    required this.id,
    required this.name,
  });
}
