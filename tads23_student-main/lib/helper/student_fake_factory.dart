import 'package:faker_dart/faker_dart.dart';
import 'package:tads23_student/domain/entities/student_tads_entidy.dart';

import '../domain/entities/student_tads_entidy.dart';

abstract class StudenteFakeFactory {
  static StudentTadsEntidy factory() {
    final faker = Faker.instance;
    faker.setLocale(FakerLocaleType.pt_PT);

    var instance = StudentTadsEntidy(
      name: faker.name.fullName(),
      address: faker.address.streetAddress(useFullAddress: true),
      phone: faker.phoneNumber.phoneNumber(),
      email: faker.internet.email(),
      age: faker.datatype.number(min: 18, max: 100),
    );
    return instance;
  }
}