import 'dart:convert';

import 'package:http/http.dart';

import 'package:flutter_holiday_app/data/protocols/http/http.dart';

class HttpAdapter implements HttpClient {
  final Client client;

  HttpAdapter(this.client);

  @override
  Future<dynamic> request({
    required String url,
    required String method,
  }) async {
    final headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };

    var response = Response('', 500);
    Future<Response>? futureResponse;

    try {
      final uri = Uri.parse(url);

      if (method == 'get') {
        futureResponse = client.get(uri, headers: headers);
      }

      if (futureResponse != null) {
        response = await futureResponse;
      }
    } catch (error) {
      throw const HttpResponseException(
        message: 'Algo de errado aconteceu. Tente novamente em breve.',
      );
    }

    return _handleResponse(response);
  }

  dynamic _handleResponse(Response response) {
    final body = response.body.isEmpty ? null : jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
      case 201:
        return body;
      case 204:
        return null;
      case 400:
      case 401:
      case 404:
        throw HttpResponseException(message: body['error']);
      default:
        throw const HttpResponseException(
          message: 'Algo de errado aconteceu. Tente novamente em breve.',
        );
    }
  }
}
