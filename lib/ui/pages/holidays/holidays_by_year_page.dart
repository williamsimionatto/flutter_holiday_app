import 'package:flutter/material.dart';

import 'package:flutter_holiday_app/ui/components/components.dart';
import 'package:flutter_holiday_app/ui/pages/holidays/components/components.dart';
import 'package:flutter_holiday_app/ui/pages/holidays/holidays.dart';
import 'package:flutter_holiday_app/ui/pages/viewmodel/viewmodel.dart';

class HolidaysByYearPage extends StatefulWidget {
  final HolidaysByYearPresenter presenter;

  const HolidaysByYearPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<HolidaysByYearPage> createState() => _HolidaysByYearPageState();
}

class _HolidaysByYearPageState extends State<HolidaysByYearPage> {
  final List<int> years = List.generate(
    10,
    (index) => DateTime.now().year + index,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Feriados',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.backgroundColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.only(right: 12, left: 4),
              child: YearList(years: years),
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ListView.builder(
              itemCount: buildList().length,
              itemBuilder: (context, index) {
                final holiday = buildList()[index];
                return HolidayCard(holiday: holiday);
              },
            ),
          ),
        ],
      ),
    );
  }

  List<HolidayViewModel> buildList() {
    return List.generate(
      10,
      (index) => const HolidayViewModel(
        date: '01/01/2023',
        dayOfWeek: 'Segunda-feira',
        name: 'Confraternização Universal',
        type: 'National',
      ),
    );
  }
}
