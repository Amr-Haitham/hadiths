// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'hadith_cubit.dart';

@immutable
abstract class HadithState {}

class HadithInitial extends HadithState {}

class HadithLoading extends HadithState {}

class HadithError extends HadithState {}

class HadithLoaded extends HadithState {
  final Hadith hadith;
  HadithLoaded({
    required this.hadith,
  });
}
