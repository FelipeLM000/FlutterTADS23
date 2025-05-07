import 'dart:math';

import 'package:tads23_student/domain/entities/student_tads_entidy.dart';

import '../common/errors/errors_classes.dart';
import '../common/errors/errors_messagens.dart';
import '../domain/entities/student_tads_entidy.dart';
import 'student_fake_factory.dart';

class StudentFakeApiDataBase {
  // late List<Pet> pets;
  StudentTadsEntidy? student;
  StudentFakeApiDataBase() {
    if (Random().nextBool()) {
      student = StudenteFakeFactory.factory();
    }
  }

  Future<String> getData() async {
    if (Random().nextBool()) {
      return throw APIFailure(MessagesError.apiError);
    }

    return student == null
        ? throw DatasourceResultEmpty(MessagesError.emptySharedP)
        : student!.toJson();
  }

  Future<bool> updateData(String studentJson) async {
    try {
      student = StudentTadsEntidy.fromJson(studentJson);
      return true;
    } catch (e) {
      throw APIFailureOnSave('erro ao salvar: ${e.toString()}');
    }
  }
}
