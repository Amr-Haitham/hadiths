import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:hadiths/3_data_layer/models/hadith_title.dart';
import 'package:hadiths/consts/assets_urls.dart';

class SingleHadithListTile extends StatelessWidget {
  const SingleHadithListTile(
      {super.key,
      required this.hadithTitle,
      required this.index,
      required this.onPressed});
  final HadithTitle hadithTitle;
  final int index;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: InkWell(
        onTap: () => onPressed(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 12,
              child: TextField(
                enabled: false,
                style: const TextStyle(color: Color.fromRGBO(108, 94, 88, 1)),
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                  //todo
                  hintText: hadithTitle.title,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(144, 126, 119, 1)),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(144, 126, 119, 1)),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(144, 126, 119, 1)),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(circleImage),
                Text(ArabicNumbers().convert(index + 1))
              ],
            ),
            const Expanded(flex: 1, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
