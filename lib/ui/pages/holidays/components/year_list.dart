import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_holiday_app/ui/pages/holidays/holidays.dart';
import 'package:flutter_holiday_app/ui/components/components.dart';
import 'package:flutter_holiday_app/ui/pages/holidays/components/components.dart';

class YearList extends StatefulWidget {
  const YearList({
    super.key,
    required this.years,
  });

  final List<int> years;

  @override
  State<YearList> createState() => _YearListState();
}

class _YearListState extends State<YearList> {
  late int selectedYear = widget.years.first;

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<HolidaysByYearPresenter>(context);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.years.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(right: 12, left: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              YearItem(
                name: widget.years[index].toString(),
                onTap: () => {
                  setState(() {
                    selectedYear = widget.years[index];
                  }),
                  presenter.load(selectedYear.toString()),
                },
                color: AppColors.primaryColor,
                isSelected: selectedYear == widget.years[index],
              ),
            ],
          ),
        );
      },
    );
  }
}
