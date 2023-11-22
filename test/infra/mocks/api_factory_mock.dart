import 'package:faker/faker.dart';

class ApiFactoryMock {
  static List<Map> makeHolidayList() => [
        {
          'name': faker.lorem.word(),
          'type': faker.lorem.word(),
          'date': '2023-01-01',
        },
        {
          'name': faker.lorem.word(),
          'type': faker.lorem.word(),
          'date': '2023-12-25',
        },
      ];
}
