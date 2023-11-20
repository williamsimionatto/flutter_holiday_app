import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_holiday_app/ui/components/components.dart';
import 'package:flutter_holiday_app/ui/pages/holidays/components/components.dart';
import 'package:flutter_holiday_app/ui/pages/holidays/holidays.dart';
import 'package:flutter_holiday_app/ui/pages/viewmodel/viewmodel.dart';

class HolidaysByYearPage extends StatefulWidget {
  final HolidaysByYearPresenter presenter;

  const HolidaysByYearPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<HolidaysByYearPage> createState() => _HolidaysByYearPageState();
}

class _HolidaysByYearPageState extends State<HolidaysByYearPage> {
  final List<int> years = List.generate(
    10,
    (index) => DateTime.now().year + index,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Feriados',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.backgroundColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Builder(
        builder: (BuildContext context) {
          widget.presenter.load(
            years.first.toString(),
          );

          return ListenableProvider(
            create: (_) => widget.presenter,
            child: StreamBuilder<List<HolidayViewModel>?>(
              stream: widget.presenter.holidaysStream,
              builder: (context, snapshot) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12, left: 4),
                        child: YearList(years: years),
                      ),
                    ),
                    const SizedBox(height: 30),
                    StreamBuilder(
                      stream: widget.presenter.isLoadingStream,
                      builder: (context, loadingSnapshot) {
                        if (loadingSnapshot.data == true ||
                            snapshot.connectionState ==
                                ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.secondaryColor,
                            ),
                          );
                        }

                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              snapshot.error.toString(),
                              style: const TextStyle(
                                color: AppColors.erroColor,
                              ),
                            ),
                          );
                        }

                        if (snapshot.hasData) {
                          final holidays = snapshot.data!;

                          return Expanded(
                            child: ListView.builder(
                              itemCount: holidays.length,
                              itemBuilder: (context, index) {
                                return HolidayCard(
                                  holiday: holidays[index],
                                );
                              },
                            ),
                          );
                        }

                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
