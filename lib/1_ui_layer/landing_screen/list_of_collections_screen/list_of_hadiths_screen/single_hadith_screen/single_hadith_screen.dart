import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadiths/1_ui_layer/freq_used_widgets/custom_back_button.dart';
import 'package:hadiths/2_bl_layer/hadiths_cubit/hadith_cubit.dart';
import 'package:hadiths/3_data_layer/models/hadith_title.dart';

import '../../../../../consts/assets_urls.dart';
import '../../../../../consts/general_functions.dart';

class SingleHadithScreen extends StatefulWidget {
  const SingleHadithScreen({super.key, required this.hadithTitle});
  final HadithTitle hadithTitle;

  @override
  State<SingleHadithScreen> createState() => _SingleHadithScreenState();
}

class _SingleHadithScreenState extends State<SingleHadithScreen> {
  @override
  void initState() {
    BlocProvider.of<HadithCubit>(context)
        .getSingleHadith(widget.hadithTitle.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      bottom: false,
      minimum: EdgeInsets.only(
        left: 18.w,
        right: 18.w,
        top: 18.h,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [CustomBackButton()],
          ),
          Expanded(
              flex: 9,
              child: BlocBuilder<HadithCubit, HadithState>(
                builder: (context, state) {
                  if (state is HadithLoaded) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(state.hadith.title,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textDirection: TextDirection.rtl,
                              style: amiriQuranFontTextStyle(
                                  28.sp, const Color.fromRGBO(108, 94, 88, 1))),
                          const NewSectionDivider(
                            title: "نص الحديث",
                          ),
                          Text(state.hadith.hadeeth,
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: amiriQuranFontTextStyle(
                                  20.sp, const Color.fromRGBO(108, 94, 88, 1))),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(state.hadith.attribution,
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                  style: amiriQuranFontTextStyle(15.sp,
                                      const Color.fromRGBO(229, 0, 18, 1))),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(state.hadith.grade,
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                  style: amiriQuranFontTextStyle(15.sp,
                                      const Color.fromRGBO(229, 0, 18, 1))),
                            ],
                          ),
                          const NewSectionDivider(
                            title: "شرح الحديث",
                          ),
                          Text(
                            state.hadith.explanation,
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: amiriQuranFontTextStyle(
                                18.sp, const Color.fromRGBO(229, 0, 18, 1)),
                          ),
                        ],
                      ),
                    );
                  } else if (state is HadithError) {
                    return const Center(child: Text("خطأ بالأتصال"));
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )),
          Center(
            child: Image.asset(circlePartBottomCenterImage, scale: 1.5),
          ),
        ],
      ),
    ));
  }
}

class NewSectionDivider extends StatelessWidget {
  const NewSectionDivider({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          smallerCircleImage,
          scale: 1.21.sp,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  redLineImage,
                  scale: 1.15.sp,
                )),
            Align(
                child: Container(
              padding: const EdgeInsets.only(bottom: 12, left: 5, right: 5),
              color: Colors.grey[50],
              child: Text(
                title,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: amiriQuranFontTextStyle(
                    15.sp, const Color.fromARGB(255, 0, 0, 0)),
              ),
            ))
          ],
        ),
        Image.asset(
          smallerCircleImage,
          scale: 1.21.sp,
        ),
      ],
    );
  }
}
