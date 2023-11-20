import 'package:flutter/material.dart';
import 'package:flutter_holiday_app/ui/components/components.dart';
import 'package:flutter_holiday_app/ui/pages/viewmodel/viewmodel.dart';

class HolidayCard extends StatelessWidget {
  final HolidayViewModel holiday;

  const HolidayCard({
    Key? key,
    required this.holiday,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      surfaceTintColor: AppColors.whiteColor,
      color: AppColors.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    holiday.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.calendar_month_outlined,
                  color: AppColors.secondaryColor,
                ),
                const SizedBox(width: 5.0),
                Expanded(
                  child: Text(
                    holiday.date,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const SizedBox(width: 5.0),
                const Icon(
                  Icons.calendar_today_outlined,
                  color: AppColors.secondaryColor,
                ),
                const SizedBox(width: 5.0),
                Expanded(
                  child: Text(
                    holiday.dayOfWeek,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
