import 'package:flutter_holiday_app/domain/entities/entities.dart';

abstract class LoadHolidaysByYear {
  Future<List<HolidayEntity>> load(String year);
}
