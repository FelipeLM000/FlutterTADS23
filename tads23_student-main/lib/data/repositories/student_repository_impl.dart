import 'dart:async';

import 'package:tads23_student/common/errors/errors_classes.dart';
import 'package:tads23_student/common/patterns/result.dart';
import 'package:tads23_student/data/repositories/student_repository_contract.dart';
import 'package:tads23_student/data/services/local_storage_contract.dart';
import 'package:tads23_student/domain/entities/student_tads_entity.dart';

class StudentRepositoryImpl implements StudentRepositoryContract {
  final LocalStorageContract _localDataService;

  StudentRepositoryImpl({
    required LocalStorageContract localDataService,
    }) : _localDataService = localDataService;

  @override
  Future<Result<StudentTadsEntity, Failure>> getStudent() async {
    var result = await _localDataService.fetchStudent();
    return result;
  }

  @override
  Future<Result<void, Failure>> saveStudent(StudentTadsEntity student) async {
    var result = await _localDataService.saveStudent(student);
    return result;
  }
}
