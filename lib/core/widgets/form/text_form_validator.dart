import 'package:flutter/material.dart';
import 'package:boilerplate/core/constants/colors.dart';
import 'package:boilerplate/core/utils/text_styles.dart';
import 'package:boilerplate/core/widgets/form/text_form.dart';
import 'package:rxdart/rxdart.dart';

class RxTextFormValidator extends StatelessWidget {
  final BehaviorSubject<String> stream;
  final CusTextForm form;

  const RxTextFormValidator({
    super.key,
    required this.stream,
    required this.form,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            form,
            if (snapshot.hasError)
              Container(
                margin: EdgeInsets.symmetric(vertical: 3),
                child: Text(
                  snapshot.error.toString(),
                  style: smMedium(kR700),
                ),
              ),
          ],
        );
      },
    );
  }
}
