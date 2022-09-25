part of 'category_cubit.dart';

class CategoryState extends Equatable {
  const CategoryState({this.categories});
  final List<String>? categories;
  //final List<String>? subCategories;
  @override
  List<Object?> get props => [categories];

  CategoryState copyWith({
    List<String>? categories,
  }) {
    return CategoryState(categories: categories ?? this.categories);
  }
}
