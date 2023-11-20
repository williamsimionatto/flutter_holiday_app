import 'package:flutter_holiday_app/main/factories/usecases/holiday/holiday.dart';
import 'package:flutter_holiday_app/presenters/holidays/holidays.dart';
import 'package:flutter_holiday_app/ui/pages/holidays/holidays.dart';

HolidaysByYearPresenter makeHolidaysByYearPresenter() => GetxHolidaysPresenter(
      loadHolidaysByYear: makeRemoteLoadHolidaysByYear(),
    );
