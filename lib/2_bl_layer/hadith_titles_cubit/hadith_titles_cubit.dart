import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../3_data_layer/models/hadith_title.dart';
import '../../3_data_layer/repo/hadiths_api_repo.dart';

part 'hadith_titles_state.dart';

class HadithTitlesCubit extends Cubit<HadithTitlesState> {
  HadithTitlesCubit() : super(HadithTitlesInitial());
  final HadithsAPIRepo _hadithAPIRepo = HadithsAPIRepo();

  void getHadithTitlesByCategory(String categoryId) async {
    emit(HadithTitlesLoading());
    try {
      List<HadithTitle> hadithTitles =
          await _hadithAPIRepo.getHadithTitlesByCategory(categoryId);

      emit(HadithTitlesLoaded(hadithTitles: hadithTitles));
    } catch (e) {
      emit(HadithTitlesError());
    }
  }
}
