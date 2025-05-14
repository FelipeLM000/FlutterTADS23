import 'package:tads23_student/common/errors/errors_classes.dart';
import 'package:tads23_student/common/patterns/result.dart';
import 'package:tads23_student/domain/entities/student_tads_entity.dart';


abstract class LocalStorageContract {
  Future<Result<StudentTadsEntity,Failure>> fetchStudent();
  Future<Result<void,Failure>> saveStudent(StudentTadsEntity student);
}