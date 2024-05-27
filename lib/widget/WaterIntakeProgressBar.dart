import 'package:menu_navigator/theme/colors.dart';
import 'package:flutter/material.dart';

class WaterIntakeProgressBar extends StatelessWidget {
  const WaterIntakeProgressBar({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: 20,
          height: size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: bgTextField),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: 20,
            height: size.height * 0.18,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    colors: [fourthColor, primary])),
          ),
        ),
      ],
    );
  }
}

