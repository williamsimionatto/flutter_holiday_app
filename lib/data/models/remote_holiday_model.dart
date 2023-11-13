import 'package:flutter_holiday_app/domain/entities/entities.dart';

class RemoteHolidayModel {
  final String name;
  final String type;
  final DateTime date;

  RemoteHolidayModel({
    required this.name,
    required this.type,
    required this.date,
  });

  factory RemoteHolidayModel.fromJson(Map json) {
    return RemoteHolidayModel(
      name: json['name'],
      type: json['type'],
      date: DateTime.parse(json['date']),
    );
  }

  HolidayEntity toEntity() => HolidayEntity(
        name: name,
        type: type,
        date: date,
      );
}
