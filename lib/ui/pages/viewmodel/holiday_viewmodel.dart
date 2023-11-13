import 'package:equatable/equatable.dart';

class HolidayViewModel extends Equatable {
  final String name;
  final String type;
  final DateTime date;

  @override
  List get props => [name, date, type];

  const HolidayViewModel({
    required this.name,
    required this.type,
    required this.date,
  });
}
