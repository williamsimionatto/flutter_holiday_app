import 'package:flutter_holiday_app/data/models/models.dart';
import 'package:flutter_holiday_app/data/protocols/http/http.dart';

import 'package:flutter_holiday_app/domain/entities/entities.dart';
import 'package:flutter_holiday_app/domain/usecases/holidays/holidays.dart';

class RemoteLoadHolidadys implements LoadHolidaysByYear {
  final String url;
  final HttpClient httpClient;

  RemoteLoadHolidadys({
    required this.url,
    required this.httpClient,
  });

  @override
  Future<List<HolidayEntity>> load(String year) async {
    try {
      final url = '${this.url}?year=$year';
      final httpResponse = await httpClient.request(url: url, method: 'get');
      if (httpResponse == null) {
        return [];
      }

      return httpResponse
          .map<HolidayEntity>(
              (json) => RemoteHolidayModel.fromJson(json).toEntity())
          .toList();
    } on Exception catch (error) {
      throw HttpResponseException(message: error.toString());
    }
  }
}
