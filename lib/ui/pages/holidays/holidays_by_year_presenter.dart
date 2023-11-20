import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_holiday_app/ui/pages/viewmodel/viewmodel.dart';

abstract class HolidaysByYearPresenter implements Listenable {
  late Rx<List<HolidayViewModel>> holidays;

  Stream<bool?>? get isLoadingStream;
  Stream<List<HolidayViewModel>?>? get holidaysStream;

  Future<void> load(String year);
}
