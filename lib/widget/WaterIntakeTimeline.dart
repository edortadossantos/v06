import 'package:menu_navigator/data/WaterIntake.dart';
import 'package:menu_navigator/theme/colors.dart';
import 'package:flutter/material.dart';

class WaterIntakeTimeLine extends StatelessWidget {
  const WaterIntakeTimeLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(waterIntakeJson.length, (index) {
        if(index != waterIntakeJson.length - 1){
            return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: thirdColor,
                shape: BoxShape.circle
              ),
            ),
            const SizedBox(width: 6,),
            Text(
             waterIntakeJson[index],
              style: TextStyle(
                  fontSize: 12,
                  color: black.withOpacity(0.5)),
            ),
          ],
        ),
        const SizedBox(height: 2,),
        Padding(
          padding: const EdgeInsets.only(left: 3),
          child: Container(
            height: 25,
            width: 1,
            decoration: const BoxDecoration(
              color: thirdColor
            ),
          ),
        ),
        const SizedBox(height: 2,),
      ],
    );
        }
        else {
          return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: thirdColor,
                shape: BoxShape.circle
              ),
            ),
            const SizedBox(width: 6,),
            Text(
             waterIntakeJson[index],
              style: TextStyle(
                  fontSize: 12,
                  color: black.withOpacity(0.5)),
            ),
          ],
        ),
      ],
    );
        }
      }),
    );
  }
}