// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'hadith_titles_cubit.dart';

@immutable
abstract class HadithTitlesState {}

class HadithTitlesInitial extends HadithTitlesState {}

class HadithTitlesLoading extends HadithTitlesState {}

class HadithTitlesError extends HadithTitlesState {}

class HadithTitlesLoaded extends HadithTitlesState {
  final List<HadithTitle> hadithTitles;
  HadithTitlesLoaded({
    required this.hadithTitles,
  });
}
