import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:manage_finance/features/home/models/student_model.dart';
import 'package:manage_finance/features/teachers/data/models/new_teacher_student_model.dart';
import 'package:manage_finance/features/teachers/data/models/teacher_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  DBHelper();

  late Database database;

  final String databaseName = 'manage_fianace.db';
  final int databaseVersion = 1;
  final String tableStudent = 'student';
  final String tableTeacher = 'teacher';
  final String tableTeacherStuden = 'teacher_student';
  final String tableDeletedStudens = 'deleted_students';

  // opens the database (and creates if it do not exist)
  Future<void> init() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, databaseName);

    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets/db", databaseName));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);
    } else {}
    database = await openDatabase(
      path,
    );
  }

  Future<List<StudentModel>> getStudents() async {
    try {
      if (database.isOpen) {
        final response = await database.rawQuery(
          '''SELECT * FROM student''',
        );
        final listStudents = List<StudentModel>.from(response.map((e) {
          return StudentModel.fromJson(e);
        }));
        return listStudents;
      }
    } catch (e) {
      log("getSpeakingViewList", error: e.toString());
    }
    return [];
  }

  Future<List<TeacherModel>> getTEachers() async {
    try {
      if (database.isOpen) {
        final response = await database.rawQuery(
          '''SELECT teacher.id,teacher.subject_name,  teacher.name ,teacher.fees,
	            COUNT(student.name)as pupils, sum((student.days/30.0 )*teacher.fees )as payment
              from ((teacher_student INNER JOIN student on student.id==teacher_student.student_id) 
              INNER JOIN teacher on teacher.id==teacher_student.teacher_id)''',
        );
        final listTeachers = List<TeacherModel>.from(response.map((e) {
          return TeacherModel.fromJson(e);
        }));
        return listTeachers;
      }
    } catch (e) {
      log("getSpeakingViewList", error: e.toString());
    }
    return [];
  }

  Future<List<StudentModel>> getTeachersStudents({required int id}) async {
    try {
      if (database.isOpen) {
        final response = await database.rawQuery(
          '''SELECT * from student 
              WHERE id in 
              (SELECT student_id from teacher_student 
                    WHERE teacher_id==$id)''',
        );
        final listTeachers = List<StudentModel>.from(response.map((e) {
          return StudentModel.fromJson(e);
        }));
        return listTeachers;
      }
    } catch (e) {
      log("getSpeakingViewList", error: e.toString());
    }
    return [];
  }

  Future<List<NewStudentModel>> getNewTeachersStudents(
      {required int id}) async {
    try {
      if (database.isOpen) {
        final response = await database.rawQuery(
          '''SELECT id, name ,0 as inLesson FROM student WHERE id NOT in (SELECT student_id from teacher_student WHERE teacher_id==$id)
              UNION
              SELECT id, name, 1 as inLesson from student WHERE id in (SELECT student_id from teacher_student WHERE teacher_id==$id)
              ORDER BY name''',
        );
        final listStudents = List<NewStudentModel>.from(response.map((e) {
          return NewStudentModel.fromJson(e);
        }));
        return listStudents;
      }
    } catch (e) {
      log("getSpeakingViewList", error: e.toString());
    }
    return [];
  }

  Future<List<NewStudentModel>> addStudentForTeachers(
      {required int teacherId, required int studentId}) async {
    try {
      if (database.isOpen) {
        await database.insert(tableTeacherStuden, {
          "student_id": studentId,
          "teacher_id": teacherId,
          "date_id": 2,
        });
      }
    } catch (e) {
      log("getSpeakingViewList", error: e.toString());
    }
    return [];
  }

  Future<void> setPayment(StudentModel studentModel) async {
    try {
      if (database.isOpen) {
        database.rawUpdate(
          '''
            UPDATE student 
            SET payment=${studentModel.payment}, 
              payment_date=${DateTime.now().millisecondsSinceEpoch}, 
              days=${studentModel.days} 
            WHERE id==${studentModel.id}''',
        );
      }
    } catch (e) {
      log("getSpeakingViewList", error: e.toString());
    }
  }

  Future<void> addNewStudent(StudentModel studentModel) async {
    try {
      if (database.isOpen) {
        database.insert(
          tableStudent,
          studentModel.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    } catch (e) {
      log("getSpeakingViewList", error: e.toString());
    }
  }

  Future<void> deleteStudent(StudentModel studentModel) async {
    try {
      if (database.isOpen) {
        database.insert(
          tableDeletedStudens,
          studentModel.toJson(isDeleted: true),
        );
        database.rawDelete("DELETE FROM student WHERE id==${studentModel.id};");
      }
    } catch (e) {
      log("getSpeakingViewList", error: e.toString());
    }
  }
}
