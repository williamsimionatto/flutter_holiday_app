import 'package:flutter_holiday_app/ui/pages/viewmodel/viewmodel.dart';

class ViewModelFactory {
  static List<HolidayViewModel> makeHolidayList() => [
        const HolidayViewModel(
          name: 'Feriado 1',
          type: 'national',
          date: '01/01/2023',
          dayOfWeek: 'Segunda-feira',
        ),
        const HolidayViewModel(
          name: 'Feriado 2',
          type: 'national',
          date: '25/12/2023',
          dayOfWeek: 'Terça-feira',
        )
      ];
}
