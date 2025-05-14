import 'package:faker_dart/faker_dart.dart';

import '../domain/entities/student_tads_entity.dart';

abstract class StudentFakeFactory {
  static StudentTadsEntity factory() {
    final faker = Faker.instance;
    faker.setLocale(FakerLocaleType.pt_PT);

    var instance = StudentTadsEntity(
      name: faker.name.fullName(),
      address: faker.address.streetAddress(useFullAddress: true),
      phone: faker.phoneNumber.phoneNumber(),
      email: faker.internet.email(),
      age: faker.datatype.number(min: 18, max: 100),
    );
    return instance;
  }
}