import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../consts/assets_urls.dart';
import '../../consts/general_functions.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Image.asset(backIconImage),
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
        ),
        label: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            "الرجوع",
            style: amiriQuranFontTextStyle(
                15.sp, const Color.fromRGBO(229, 0, 18, 1)),
          ),
        ));
  }
}
