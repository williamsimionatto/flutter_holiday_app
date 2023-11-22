import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:flutter_holiday_app/presentation/presenters/holidays/holidays.dart';
import '../../../data/mocks/usecases/holidays/holidays.dart';

void main() {
  late LoadHolidaysByYearSpy loadHolidaysByYear;
  late GetxHolidaysByYearPresenter sut;
  late String year;

  setUp(() {
    loadHolidaysByYear = LoadHolidaysByYearSpy();
    loadHolidaysByYear.mockLoad([]);
    year = '2023';

    sut = GetxHolidaysByYearPresenter(
      loadHolidaysByYear: loadHolidaysByYear,
    );
  });

  test('Should call LoadHolidaysByYear on load data', () async {
    await sut.load(year);
    verify(() => loadHolidaysByYear.load(year)).called(1);
  });
}
