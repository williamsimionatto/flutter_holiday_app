import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:flutter_holiday_app/domain/entities/entities.dart';
import 'package:flutter_holiday_app/presentation/presenters/holidays/holidays.dart';

import 'package:flutter_holiday_app/ui/pages/viewmodel/viewmodel.dart';
import 'package:flutter_holiday_app/ui/extensions/extensions.dart';
import '../../../data/mocks/usecases/holidays/holidays.dart';
import '../../../domain/mocks/enitity_factory.dart';

void main() {
  late LoadHolidaysByYearSpy loadHolidaysByYear;
  late GetxHolidaysByYearPresenter sut;
  late String year;
  late List<HolidayEntity> holidays;

  setUp(() {
    holidays = EntityFactory.makeHolidays();
    loadHolidaysByYear = LoadHolidaysByYearSpy();
    loadHolidaysByYear.mockLoad(holidays);
    year = '2023';

    sut = GetxHolidaysByYearPresenter(
      loadHolidaysByYear: loadHolidaysByYear,
    );
  });

  test('Should call LoadHolidaysByYear on load data', () async {
    await sut.load(year);
    verify(() => loadHolidaysByYear.load(year)).called(1);
  });

  test('Should emit correct events on load data success', () async {
    sut.holidaysStream.listen(expectAsync1(
      (holidaysData) => expect(
        holidaysData,
        [
          HolidayViewModel(
            name: holidays[0].name,
            type: holidays[0].type,
            date: holidays[0].date.format(),
            dayOfWeek: holidays[0].date.dayOfWeek(),
          ),
          HolidayViewModel(
            name: holidays[1].name,
            type: holidays[1].type,
            date: holidays[1].date.format(),
            dayOfWeek: holidays[1].date.dayOfWeek(),
          )
        ],
      ),
    ));
    await sut.load(year);
  });
}
