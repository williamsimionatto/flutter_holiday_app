import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:flutter_holiday_app/data/protocols/http/http.dart';
import 'package:flutter_holiday_app/infra/http/http_adapter.dart';

import '../mocks/mocks.dart';

void main() {
  late HttpAdapter sut;
  late ClientSpy client;
  late String url;

  setUp(() {
    client = ClientSpy();
    sut = HttpAdapter(client);
  });

  setUpAll(() {
    url = faker.internet.httpUrl();
    registerFallbackValue(Uri.parse(url));
  });

  group('shared', () {
    test('Should throw ServerError if invalid http method is provided',
        () async {
      final future = sut.request(url: url, method: 'invalid_method');
      expect(future, throwsA(isA<HttpResponseException>()));
    });
  });

  group('GET', () {
    test('Should call get with correct values', () async {
      await sut.request(url: url, method: 'get');

      verify(() => client.get(Uri.parse(url), headers: {
            'content-type': 'application/json',
            'accept': 'application/json'
          }));
    });

    test('Should return data if get returns 200', () async {
      final response = await sut.request(url: url, method: 'get');
      expect(response, {'any_key': 'any_value'});
    });

    test('Should return null if get returns 200 without data', () async {
      client.mockGet(200, body: '');

      final response = await sut.request(url: url, method: 'get');
      expect(response, null);
    });

    test('Should return null if get returns 204', () async {
      client.mockGet(204, body: '');

      final response = await sut.request(url: url, method: 'get');
      expect(response, null);
    });

    test('Should return null if get returns 204 with data', () async {
      client.mockGet(204);

      final response = await sut.request(url: url, method: 'get');
      expect(response, null);
    });

    test('Should return BadRequestError if get returns 400', () async {
      client.mockGet(400, body: '{"error": "any_error"}');

      final future = sut.request(url: url, method: 'get');
      expect(future, throwsA(isA<HttpResponseException>()));
    });

    test('Should return UnauthorizedError if get returns 401', () async {
      client.mockGet(401, body: '{"error": "any_error"}');

      final future = sut.request(url: url, method: 'get');
      expect(future, throwsA(isA<HttpResponseException>()));
    });

    test('Should return NotFoundError if get returns 404', () async {
      client.mockGet(404, body: '{"error": "any_error"}');

      final future = sut.request(url: url, method: 'get');
      expect(future, throwsA(isA<HttpResponseException>()));
    });

    test('Should return ServerError if get returns 500', () async {
      client.mockGet(500);

      final future = sut.request(url: url, method: 'get');
      expect(future, throwsA(isA<HttpResponseException>()));
    });

    test('Should return ServerError if get throws', () async {
      client.mockGetError();

      final future = sut.request(url: url, method: 'get');
      expect(future, throwsA(isA<HttpResponseException>()));
    });
  });
}
