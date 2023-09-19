import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/core/constants/colors.dart';
import 'package:boilerplate/core/utils/text_styles.dart';
import 'package:boilerplate/core/constants/route_path.dart';
import 'package:boilerplate/injection/injector.dart';

@RoutePage(name: kHomeR)
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: size.pSW(26),
            vertical: size.pSH(45),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: size.pSH(25)),
                alignment: Alignment.centerLeft,
                child: Text("Home", style: xl1Semibold(kBlack)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
