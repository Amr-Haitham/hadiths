import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../3_data_layer/models/hadith.dart';
import '../../3_data_layer/repo/hadiths_api_repo.dart';

part 'hadith_state.dart';

class HadithCubit extends Cubit<HadithState> {
  HadithCubit() : super(HadithInitial());
  final HadithsAPIRepo _hadithAPIRepo = HadithsAPIRepo();
  void getSingleHadith(String hadithId) async {
    emit(HadithLoading());
    try {
      Hadith hadith = await _hadithAPIRepo.getSingleHadith(hadithId);
      emit(HadithLoaded(hadith: hadith));
    } catch (e) {
      emit(HadithError());
    }
  }
}
