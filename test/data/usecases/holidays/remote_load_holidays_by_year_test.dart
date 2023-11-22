import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:flutter_holiday_app/data/usecases/holidays/holidays.dart';

import '../../mocks/mocks.dart';

void main() {
  late String url;
  late HttpClientSpy httpClient;
  late RemoteLoadHolidadysByYear sut;
  late String year;
  late List<Map> apiResult;

  setUp(() {
    url = faker.internet.httpUrl();
    year = faker.randomGenerator.integer(2040).toString();
    httpClient = HttpClientSpy();
    sut = RemoteLoadHolidadysByYear(url: url, httpClient: httpClient);
    apiResult = [];
    httpClient.mockRequest(apiResult);
  });

  test('Should call HttpClient with correct values', () async {
    await sut.load(year);
    verify(() => httpClient.request(url: '$url/$year', method: 'get'));
  });
}
