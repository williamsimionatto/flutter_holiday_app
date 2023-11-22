import 'dart:async';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_holiday_app/ui/pages/viewmodel/viewmodel.dart';
import 'package:flutter_holiday_app/ui/pages/holidays/holidays.dart';

import 'viewmodel_factory.dart';

class HolidaysByYearPresenterSpy extends Mock
    implements HolidaysByYearPresenter {
  final loadHolidaysByYearController =
      StreamController<List<HolidayViewModel>>();

  HolidaysByYearPresenterSpy() {
    when(() => load(any()))
        .thenAnswer((_) async => ViewModelFactory.makeHolidayList());

    when(() => holidays).thenReturn(
      Rx<List<HolidayViewModel>>(ViewModelFactory.makeHolidayList()),
    );
    when(() => holidaysStream)
        .thenAnswer((_) => loadHolidaysByYearController.stream);
  }

  void emitHolidays(List<HolidayViewModel> holidays) =>
      loadHolidaysByYearController.add(holidays);

  void emitHolidaysError() => loadHolidaysByYearController.addError(
        'Erro ao buscar feriados',
      );

  void dispose() {
    loadHolidaysByYearController.close();
  }
}
