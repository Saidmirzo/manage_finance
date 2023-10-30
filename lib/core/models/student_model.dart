import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class StudentModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;

  StudentModel({
    required this.id,
    required this.name,
  });
}