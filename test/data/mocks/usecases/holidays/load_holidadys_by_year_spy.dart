import 'package:mocktail/mocktail.dart';

import 'package:flutter_holiday_app/domain/entities/entities.dart';
import 'package:flutter_holiday_app/domain/usecases/holidays/holidays.dart';

class LoadHolidaysByYearSpy extends Mock implements LoadHolidaysByYear {
  When mockLoadCall() => when(() => load(any()));
  void mockLoad(List<HolidayEntity> holidays) =>
      mockLoadCall().thenAnswer((_) async => holidays);
  void mockLoadError(dynamic error) => mockLoadCall().thenThrow(error);
}
