import 'package:bloc/bloc.dart';
import 'package:hadiths/3_data_layer/models/category.dart';
import 'package:hadiths/3_data_layer/repo/hadiths_api_repo.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  final HadithsAPIRepo _hadithsAPIRepo = HadithsAPIRepo();
  void getAllCategories() async {
    emit(CategoryLoading());
    try {
      List<Category> categories = await _hadithsAPIRepo.getAllCategories();
      emit(CategoryLoaded(categories: categories));
    } catch (e) {
      emit(CategoryError());
    }
  }
}
