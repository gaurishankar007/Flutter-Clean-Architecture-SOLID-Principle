import 'package:flutter/material.dart';

import '../../../../../core/utils/screen_util/screen_util.dart';

class NetworkTowerWidget extends StatelessWidget {
  const NetworkTowerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const deepPurple = Colors.deepPurple;
    const purpleAccent = Colors.purpleAccent;

    return Container(
      padding: EdgeInsets.all(ScreenUtil.I.widthPercentage(8)),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            deepPurple.withOpacity(.075),
            purpleAccent.withOpacity(.075)
          ],
        ),
        shape: BoxShape.circle,
      ),
      child: Container(
        padding: EdgeInsets.all(ScreenUtil.I.widthPercentage(6.5)),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [deepPurple.withOpacity(.1), purpleAccent.withOpacity(.1)],
          ),
          shape: BoxShape.circle,
        ),
        child: Container(
          padding: EdgeInsets.all(ScreenUtil.I.widthPercentage(5)),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                deepPurple.withOpacity(.125),
                purpleAccent.withOpacity(.125)
              ],
            ),
            shape: BoxShape.circle,
          ),
          child: Container(
            height: ScreenUtil.I.widthPercentage(35),
            width: ScreenUtil.I.widthPercentage(35),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [deepPurple, purpleAccent],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.2),
                  spreadRadius: 1,
                  blurRadius: 3,
                ),
              ],
            ),
            child: Icon(
              Icons.cell_tower_rounded,
              size: ScreenUtil.I.widthPercentage(25),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
