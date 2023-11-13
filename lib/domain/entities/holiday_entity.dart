import 'package:equatable/equatable.dart';

class HolidayEntity extends Equatable {
  final String name;
  final String type;
  final DateTime date;

  const HolidayEntity({
    required this.name,
    required this.type,
    required this.date,
  });

  @override
  List<Object?> get props => [name, type, date];
}
