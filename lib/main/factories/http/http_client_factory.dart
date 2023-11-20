import 'package:http/http.dart';

import 'package:flutter_holiday_app/data/protocols/http/http.dart';
import 'package:flutter_holiday_app/infra/http/http_adapter.dart';

HttpClient makeHttpClientAdapter() => HttpAdapter(Client());
