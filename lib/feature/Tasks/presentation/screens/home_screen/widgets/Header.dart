import 'package:flutter/material.dart';

import '../../../../../../core/app_colors.dart';
import '../../../../../../core/app_data.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.dateNow});

  final String dateNow;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.person, color: AppColors.mainColor),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      Data.days[DateTime.now().weekday],
                      style: TextStyle(
                        color: AppColors.lightGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      dateNow,
                      style: TextStyle(
                        color: AppColors.lightGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Text(
                  DateTime.now().day.toString(),
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ],
        ),
        Divider(color: AppColors.lightGrey),
      ],
    );
  }
}
