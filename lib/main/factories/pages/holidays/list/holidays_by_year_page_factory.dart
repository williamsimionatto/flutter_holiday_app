import 'package:flutter/material.dart';
import 'package:flutter_holiday_app/main/factories/pages/holidays/list/holidays_by_year_presenter_factory.dart';
import 'package:flutter_holiday_app/ui/pages/holidays/holidays_by_year_page.dart';

Widget makeHolidaysByYearPage() => HolidaysByYearPage(
      presenter: makeHolidaysByYearPresenter(),
    );
