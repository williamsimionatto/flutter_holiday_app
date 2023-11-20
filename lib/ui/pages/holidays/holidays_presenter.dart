import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_holiday_app/ui/pages/viewmodel/viewmodel.dart';

abstract class HolidaysPresenter implements Listenable {
  late Rx<List<HolidayViewModel>> categories;

  Stream<bool?>? get isLoadingStream;
  Stream<List<HolidayViewModel>?>? get holidaysStream;

  Future<void> load(String year);
}
