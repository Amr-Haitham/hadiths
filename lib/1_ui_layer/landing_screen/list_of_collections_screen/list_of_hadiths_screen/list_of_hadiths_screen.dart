import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadiths/1_ui_layer/freq_used_widgets/custom_back_button.dart';
import 'package:hadiths/1_ui_layer/landing_screen/list_of_collections_screen/list_of_hadiths_screen/components/single_hadith_listtile.dart';
import 'package:hadiths/1_ui_layer/landing_screen/list_of_collections_screen/list_of_hadiths_screen/single_hadith_screen/single_hadith_screen.dart';
import 'package:hadiths/2_bl_layer/hadith_titles_cubit/hadith_titles_cubit.dart';
import 'package:hadiths/2_bl_layer/hadiths_cubit/hadith_cubit.dart';
import 'package:hadiths/consts/general_functions.dart';
import '../../../../3_data_layer/models/category.dart';
import '../../../freq_used_widgets/search_bar.dart';

class ListOfHadithsScreen extends StatefulWidget {
  const ListOfHadithsScreen({super.key, required this.category});
  final Category category;

  @override
  State<ListOfHadithsScreen> createState() => _ListOfHadithsScreenState();
}

class _ListOfHadithsScreenState extends State<ListOfHadithsScreen> {
  @override
  void initState() {
    BlocProvider.of<HadithTitlesCubit>(context)
        .getHadithTitlesByCategory(widget.category.id);
    super.initState();
  }

  String searchText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 18.w, left: 18.w),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomBackButton(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, right: 50, left: 50),
            child: SearchBarWithRedSearchIcon(
              hintText: "الحديث تريد البحث عنه...",
              onChanged: (text) {
                setState(() {
                  searchText = text;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        widget.category.title,
                        style: amiriQuranFontTextStyle(
                            29.sp, const Color.fromRGBO(108, 94, 88, 1)),
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Expanded(
            child: BlocBuilder<HadithTitlesCubit, HadithTitlesState>(
              builder: (context, state) {
                if (state is HadithTitlesLoaded) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.hadithTitles
                          .where((hadithTitle) =>
                              hadithTitle.title.contains(searchText))
                          .length,
                      itemBuilder: (ctx, index) {
                        return SingleHadithListTile(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (ctx) {
                                return BlocProvider(
                                  create: (context) => HadithCubit(),
                                  child: SingleHadithScreen(
                                    hadithTitle: state.hadithTitles
                                        .where((hadithTitle) => hadithTitle
                                            .title
                                            .contains(searchText))
                                        .toList()[index],
                                  ),
                                );
                              }));
                            },
                            index: index,
                            hadithTitle: state.hadithTitles[index]);
                      });
                } else if (state is HadithTitlesError) {
                  return const Center(
                    child: Text("خطأ بالأتصال"),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    ));
  }
}
