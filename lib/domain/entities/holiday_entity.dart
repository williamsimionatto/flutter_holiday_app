import 'package:equatable/equatable.dart';

class HolidayEntity extends Equatable {
  final String name;
  final String type;
  final DateTime start;

  const HolidayEntity({
    required this.name,
    required this.type,
    required this.start,
  });

  @override
  List<Object?> get props => [name, type, start];
}
