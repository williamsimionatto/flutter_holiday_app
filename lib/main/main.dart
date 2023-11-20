import 'package:flutter/material.dart';
import 'package:flutter_holiday_app/ui/pages/holidays/holidays_by_year_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Holiday App',
      initialRoute: '/holidays',
      getPages: [
        GetPage(
          name: '/holidays',
          page: () => const HolidaysByYearPage(),
        ),
      ],
    );
  }
}
