import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class ClientSpy extends Mock implements Client {
  ClientSpy() {
    mockPost(200);
    mockPut(200);
    mockGet(200);
    mockDelete(200);
    mockPatch(200);
  }

  When mockPostCall() => when(() => this
      .post(any(), body: any(named: 'body'), headers: any(named: 'headers')));
  void mockPost(int statusCode, {String body = '{"any_key":"any_value"}'}) =>
      mockPostCall().thenAnswer((_) async => Response(body, statusCode));
  void mockPostError() =>
      mockPostCall().thenAnswer((_) async => {'error': 'any_error'});

  When mockPutCall() => when(() => this
      .put(any(), body: any(named: 'body'), headers: any(named: 'headers')));
  void mockPut(int statusCode, {String body = '{"any_key":"any_value"}'}) =>
      mockPutCall().thenAnswer((_) async => Response(body, statusCode));
  void mockPutError() =>
      mockPutCall().thenAnswer((_) async => {'error': 'any_error'});

  When mockGetCall() =>
      when(() => this.get(any(), headers: any(named: 'headers')));
  void mockGet(int statusCode, {String body = '{"any_key":"any_value"}'}) =>
      mockGetCall().thenAnswer((_) async => Response(body, statusCode));
  void mockGetError() =>
      mockGetCall().thenAnswer((_) async => {'error': 'any_error'});

  When mockDeleteCall() =>
      when(() => this.delete(any(), headers: any(named: 'headers')));
  void mockDelete(int statusCode, {String body = '{"any_key":"any_value"}'}) =>
      mockDeleteCall().thenAnswer((_) async => Response(body, statusCode));

  void mockDeleteError() =>
      mockDeleteCall().thenAnswer((_) async => {'error': 'any_error'});

  When mockPatchCall() => when(() => this
      .patch(any(), body: any(named: 'body'), headers: any(named: 'headers')));
  void mockPatch(int statusCode, {String body = '{"any_key":"any_value"}'}) =>
      mockPatchCall().thenAnswer((_) async => Response(body, statusCode));
  void mockPatchError() =>
      mockPatchCall().thenAnswer((_) async => {'error': 'any_error'});
}
