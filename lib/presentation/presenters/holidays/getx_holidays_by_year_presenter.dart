import 'package:get/get.dart';

import 'package:flutter_holiday_app/data/protocols/http/http.dart';
import 'package:flutter_holiday_app/domain/usecases/holidays/holidays.dart';

import 'package:flutter_holiday_app/presentation/mixins/mixins.dart';

import 'package:flutter_holiday_app/ui/extensions/extensions.dart';
import 'package:flutter_holiday_app/ui/pages/holidays/holidays.dart';
import 'package:flutter_holiday_app/ui/pages/viewmodel/viewmodel.dart';

class GetxHolidaysByYearPresenter extends GetxController
    with LoadingManager
    implements HolidaysByYearPresenter {
  late LoadHolidaysByYear loadHolidaysByYear;

  GetxHolidaysByYearPresenter({
    required this.loadHolidaysByYear,
  });

  @override
  Rx<List<HolidayViewModel>> holidays = Rx<List<HolidayViewModel>>([]);

  @override
  Stream<List<HolidayViewModel>?>? get holidaysStream =>
      holidays.stream.map((holidays) => holidays.toList());

  @override
  Future<void> load(String year) async {
    try {
      isLoading = true;
      final holidaysByYear = await loadHolidaysByYear.load(year);
      await Future.delayed(const Duration(seconds: 1));

      holidays.value = holidaysByYear
          .map((holiday) => HolidayViewModel(
                name: holiday.name,
                type: holiday.type,
                date: holiday.date.format(),
                dayOfWeek: holiday.date.dayOfWeek(),
              ))
          .toList();
    } on HttpResponseException catch (_) {
      holidays.subject.addError(
        'Erro ao carregar os feriados',
        StackTrace.empty,
      );
    } finally {
      isLoading = false;
    }
  }
}
