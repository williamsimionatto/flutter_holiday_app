import 'package:flutter_holiday_app/domain/entities/entities.dart';

abstract class LoadHolidays {
  Future<List<HolidayEntity>> load();
}
