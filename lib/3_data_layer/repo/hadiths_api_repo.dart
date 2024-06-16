import 'dart:convert';
import 'package:hadiths/3_data_layer/models/hadith_title.dart';
import 'package:hadiths/3_data_layer/services/hadiths_api.dart';

import '../models/category.dart';
import '../models/hadith.dart';

class HadithsAPIRepo {
  final HadithsAPI _hadithsAPI = HadithsAPI();

  Future<List<Category>> getAllCategories() async {
    var response = await _hadithsAPI.getAllCategories();
    List<Category> categories = [];
    for (var category in json.decode(response.body)) {
      categories.add(Category.fromMap(category));
    }
    return categories;
  }

  Future<List<HadithTitle>> getHadithTitlesByCategory(String categoryId) async {
    var response = await _hadithsAPI.getHadithTitlesByCategory(categoryId);
    List<HadithTitle> hadithTitles = [];
    for (var hadithTitle in json.decode(response.body)["data"]) {
      hadithTitles.add(HadithTitle.fromMap((hadithTitle)));
    }
    return hadithTitles;
  }

  Future<Hadith> getSingleHadith(String hadithId) async {
    var response = await _hadithsAPI.getSingleHadith(hadithId);
    return Hadith.fromMap((json.decode(response.body)));
  }
}
