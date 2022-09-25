part of 'products_cubit.dart';

class ProductsState extends Equatable {
  const ProductsState(
      {this.products,
      this.isLoading,
      this.categories,
      this.productCount,
      this.isInitial = false});

  final List<Product>? products;
  final bool? isLoading;
  final List<String>? categories;

  final bool isInitial;
  final int? productCount;

  @override
  List<Object?> get props => [products, isLoading, categories, productCount];

  ProductsState copyWith(
      {List<Product>? products,
      bool? isLoading,
      List<String>? categories,
      int? productCount}) {
    return ProductsState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      categories: categories ?? this.categories,
      productCount: productCount ?? this.productCount,
    );
  }
}
