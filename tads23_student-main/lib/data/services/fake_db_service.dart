import 'package:tads23_student/common/errors/errors_classes.dart';
import 'package:tads23_student/common/patterns/result.dart';
import 'package:tads23_student/data/services/local_storage_contract.dart';
import 'package:tads23_student/domain/entities/student_tads_entity.dart';
import 'package:tads23_student/helper/student_fake_repository.dart';

class FakeDbService implements LocalStorageContract {
  StudentFakeApiDataBase fakeDB = StudentFakeApiDataBase();

  @override
  Future<Result<StudentTadsEntity, Failure>> fetchStudent() async {
    try {
      var result = await fakeDB.getData();
      StudentTadsEntity student = StudentTadsEntity.fromJson(result);
      return Success(student);
    } on DatasourceResultEmpty catch (e) {
      return Error(DatasourceResultEmpty(e.toString()));
    } on APIFailure catch (e) {
      return Error(APIFailure(e.toString()));
    } on Exception catch (e) {
      return Error(
        DefaultError('Erro ao buscar o estudante:  ${e.toString()}'),
      );
    }
  }

  @override
  Future<Result<void, Failure>> saveStudent(StudentTadsEntity student) async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      fakeDB.updateData(student.toJson());

      return const Success(null);
    } on APIFailureOnSave catch (e) {
      return Error(APIFailureOnSave(e.toString()));
    } on Exception catch (e) {
      return Error(
        DefaultError('Erro deconhecido ao salvar o estudante: ${e.toString()}'),
      );
    }
  }
}
