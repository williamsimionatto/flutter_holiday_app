import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:flutter_holiday_app/domain/entities/entities.dart';
import 'package:flutter_holiday_app/data/usecases/holidays/holidays.dart';

import '../../../infra/mocks/mocks.dart';
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
    apiResult = ApiFactoryMock.makeHolidayList();
    httpClient.mockRequest(apiResult);
  });

  test('Should call HttpClient with correct values', () async {
    await sut.load(year);
    verify(() => httpClient.request(url: '$url/$year', method: 'get'));
  });

  test('Should return a list of Holiday on success', () async {
    final holidays = await sut.load(year);

    expect(holidays, [
      HolidayEntity(
        name: apiResult[0]['name'],
        type: apiResult[0]['type'],
        date: DateTime.parse(apiResult[0]['date']),
      ),
      HolidayEntity(
        name: apiResult[1]['name'],
        type: apiResult[1]['type'],
        date: DateTime.parse(apiResult[1]['date']),
      ),
    ]);
  });

  test('Should return empty list if HttpClient returns 204', () async {
    httpClient.mockRequest(null);
    final response = await sut.load(year);
    expect(response, []);
  });
}
