import 'package:equatable/equatable.dart';

class HolidayViewModel extends Equatable {
  final String name;
  final String type;
  final String date;
  final String dayOfWeek;

  @override
  List get props => [name, date, type, dayOfWeek];

  const HolidayViewModel({
    required this.name,
    required this.type,
    required this.date,
    required this.dayOfWeek,
  });
}
