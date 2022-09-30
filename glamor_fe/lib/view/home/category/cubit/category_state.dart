part of 'category_cubit.dart';

class CategoryState extends Equatable {
  const CategoryState({this.categories, this.subcategories});
  final List<Category>? categories;
  final List<Subcategories>? subcategories;
  //final List<String>? subCategories;
  @override
  List<Object?> get props => [categories, subcategories];

  CategoryState copyWith({
    List<Category>? categories,
    List<Subcategories>? subcategories,
  }) {
    return CategoryState(
      categories: categories ?? this.categories,
      subcategories: subcategories ?? this.subcategories,
    );
  }
}
