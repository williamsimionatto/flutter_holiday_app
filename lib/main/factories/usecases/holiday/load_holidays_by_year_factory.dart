import 'package:flutter_holiday_app/data/usecases/holidays/holidays.dart';
import 'package:flutter_holiday_app/domain/usecases/holidays/holidays.dart';
import 'package:flutter_holiday_app/main/factories/http/http.dart';

LoadHolidaysByYear makeRemoteLoadHolidaysByYear() => RemoteLoadHolidadysByYear(
      url: makeApiUrl('feriados/v1'),
      httpClient: makeHttpClientAdapter(),
    );
