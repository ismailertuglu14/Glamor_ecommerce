part of 'products_cubit.dart';

class ProductsState extends Equatable {
  const ProductsState({this.products, this.isLoading, this.categories});

  final List<Product>? products;
  final bool? isLoading;
  final List<String>? categories;
  @override
  List<Object?> get props => [products, isLoading, categories];

  ProductsState copyWith(
      {List<Product>? products, bool? isLoading, List<String>? categories}) {
    return ProductsState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      categories: categories ?? this.categories,
    );
  }
}
