import 'package:mocktail/mocktail.dart';

import 'package:flutter_holiday_app/data/protocols/http/http.dart';

class HttpClientSpy extends Mock implements HttpClient {
  When mockRequestCall() => when(() => request(
        url: any(named: 'url'),
        method: any(named: 'method'),
      ));

  void mockRequest(dynamic data) =>
      mockRequestCall().thenAnswer((_) async => data);

  void mockRequestError(dynamic error) => mockRequestCall().thenThrow(
        error,
      );
}
