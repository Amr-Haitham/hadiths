import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadiths/consts/assets_urls.dart';

import '../../../../consts/general_functions.dart';

class SingleBookTitleListTile extends StatelessWidget {
  const SingleBookTitleListTile(
      {super.key, required this.nameOfHadithTitle, required this.onPressed});
  final String nameOfHadithTitle;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      hoverColor: Colors.transparent,
      onTap: () => onPressed(),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 1, child: Image.asset(smallerCircleImage)),
          Expanded(
            flex: 7,
            child: Text(
              textDirection: TextDirection.rtl,
              nameOfHadithTitle,
              style: amiriQuranFontTextStyle(
                  28.sp, const Color.fromRGBO(108, 94, 88, 1)),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(flex: 1, child: Image.asset(smallerCircleImage))
        ],
      ),
    );
  }
}
