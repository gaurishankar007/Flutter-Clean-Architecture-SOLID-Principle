import 'package:flutter/material.dart';

import '../../injection/injector.dart';
import '../constants/colors.dart';
import '../constants/ui_text.dart';
import '../utils/text_styles.dart';
import 'button.dart';

class NoNetworkBox extends StatelessWidget {
  final Future Function() callBack;
  const NoNetworkBox({super.key, required this.callBack});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: size.pSH(10)),
          Container(
            padding: EdgeInsets.all(size.width * .08),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.deepPurple.withOpacity(.075),
                  Colors.purpleAccent.withOpacity(.075),
                ],
              ),
              shape: BoxShape.circle,
            ),
            child: Container(
              padding: EdgeInsets.all(size.width * .065),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.deepPurple.withOpacity(.1),
                    Colors.purpleAccent.withOpacity(.1),
                  ],
                ),
                shape: BoxShape.circle,
              ),
              child: Container(
                padding: EdgeInsets.all(size.width * .05),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.deepPurple.withOpacity(.125),
                      Colors.purpleAccent.withOpacity(.125),
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  height: size.width * .35,
                  width: size.width * .35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: const [
                        Colors.deepPurple,
                        Colors.purpleAccent,
                      ],
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
                    size: size.width * .3,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: size.pSH(25)),
          Text(
            kWhoops,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40),
          ),
          Text(
            kNoInC,
            textAlign: TextAlign.center,
            style: xxlSemibold(kBlack),
          ),
          SizedBox(height: size.pSH(25)),
          CusButton(
            onTap: callBack,
            color: Colors.indigo,
            text: kTryAgain,
          ),
        ],
      ),
    );
  }
}
