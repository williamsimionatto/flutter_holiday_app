import 'package:faker/faker.dart';

import 'package:flutter_holiday_app/domain/entities/entities.dart';

class EntityFactory {
  static HolidayEntity makeHoliday() => HolidayEntity(
        name: faker.person.name(),
        type: 'national',
        date: DateTime.now(),
      );

  static List<HolidayEntity> makeHolidays() => [
        makeHoliday(),
        makeHoliday(),
      ];
}
