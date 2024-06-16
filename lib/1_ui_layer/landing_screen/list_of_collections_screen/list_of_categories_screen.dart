import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadiths/1_ui_layer/landing_screen/list_of_collections_screen/components/single_collection_title.dart';
import 'package:hadiths/1_ui_layer/landing_screen/list_of_collections_screen/list_of_hadiths_screen/list_of_hadiths_screen.dart';
import 'package:hadiths/2_bl_layer/hadith_titles_cubit/hadith_titles_cubit.dart';
import 'package:hadiths/consts/assets_urls.dart';
// import 'package:responsive_framework/responsive_scaled_box.dart';

import '../../../2_bl_layer/category_cubit/category_cubit.dart';
import '../../freq_used_widgets/search_bar.dart';

class ListOfCategoriesScreen extends StatefulWidget {
  const ListOfCategoriesScreen({super.key});

  @override
  State<ListOfCategoriesScreen> createState() => _ListOfCategoriesScreenState();
}

class _ListOfCategoriesScreenState extends State<ListOfCategoriesScreen> {
  @override
  void initState() {
    BlocProvider.of<CategoryCubit>(context).getAllCategories();
    super.initState();
  }

  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0, right: 50, left: 50),
            child: SearchBarWithRedSearchIcon(
              hintText: "العنوان الذي تريد البحث عنه...",
              onChanged: (text) {
                setState(() {
                  searchText = text;
                });
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoaded) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.categories
                          .where(
                              (category) => category.title.contains(searchText))
                          .length,
                      itemBuilder: (ctx, index) {
                        return SingleBookTitleListTile(
                            nameOfHadithTitle: state.categories
                                .where((category) =>
                                    category.title.contains(searchText))
                                .toList()[index]
                                .title,
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (ctx) {
                                return BlocProvider(
                                  create: (context) => HadithTitlesCubit(),
                                  child: ListOfHadithsScreen(
                                    category: state.categories[index],
                                  ),
                                );
                              }));
                            });
                      });
                } else if (state is CategoryError) {
                  return const Center(child: Text("خطأ بالأتصال"));
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          Center(
            child: Image.asset(circlePartBottomCenterImage, scale: 1.5),
          ),
        ],
      ),
    ));
  }
}
