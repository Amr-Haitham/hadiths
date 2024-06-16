import 'package:flutter/material.dart';
import 'package:hadiths/consts/assets_urls.dart';
import 'package:hadiths/consts/general_functions.dart';

class SearchBarWithRedSearchIcon extends StatelessWidget {
  const SearchBarWithRedSearchIcon(
      {super.key, required this.hintText, required this.onChanged});
  final String hintText;
  final Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        hintStyle:
            amiriQuranFontTextStyle(15, const Color.fromRGBO(108, 94, 88, 1)),
        hintText: hintText,
        hintTextDirection: TextDirection.rtl,
        suffixIcon: Image.asset(searchIconImage),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(33))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(229, 0, 18, 1)),
            borderRadius: BorderRadius.all(Radius.circular(33))),
      ),
    );
  }
}
