import 'package:flutter/foundation.dart';
import 'package:tads23_student/data/repositories/student_repository_contract.dart';
import 'package:tads23_student/domain/entities/student_tads_entity.dart';

import '../../common/errors/errors_classes.dart';
import '../../common/patterns/command.dart';
import '../../common/patterns/result.dart';

class HomePageController extends ChangeNotifier {
  HomePageController({required StudentRepositoryContract studentRepository})
    : _studentRepository = studentRepository {
    load = Command0<StudentTadsEntity, Failure>(_load);
    saveStudent = Command1(_saveStudent);
    loadSample = Command0<void, void>(_resetToStudentInfo);
  }
  final StudentRepositoryContract _studentRepository;
  StudentTadsEntity? _student;

  late Command0<void, void> loadSample;
  late Command0<StudentTadsEntity, Failure> load;
  late Command1<void, Failure, StudentTadsEntity> saveStudent;

  StudentTadsEntity? get student => _student;

  Future<Result<StudentTadsEntity, Failure>> _load() async {
    final result = await _studentRepository.getStudent();

    result.fold(
      onSuccess: (student) => _student = student,
      onFailure: (error) => _student = StudentTadsEntity.sampleInfo(),
    );

    notifyListeners();
    return result;
  }

  Future<Result<void, Failure>> _saveStudent(StudentTadsEntity student) async {
    final result = await _studentRepository.saveStudent(student);

    if (result.isFailure) {
      debugPrint('Error Loading Student: ${result.failureValueOrNull}');
    } else {
      _student = student;
    }
    notifyListeners();
    return result;
  }

  Future<Result<void, void>> _resetToStudentInfo() async {
    _student = StudentTadsEntity.sampleInfo();
    notifyListeners();
    return const Success(null);
  }
}
