// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'category_cubit.dart';
@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryError extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Category> categories;
  CategoryLoaded({
    required this.categories,
  });
}
