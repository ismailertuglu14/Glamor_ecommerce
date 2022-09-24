part of 'products_cubit.dart';

class ProductsState extends Equatable {
  const ProductsState({this.products, this.isLoading});

  final List<Product>? products;
  final bool? isLoading;
  @override
  List<Object?> get props => [products, isLoading];

  ProductsState copyWith({List<Product>? products, bool? isLoading}) {
    return ProductsState(
        products: products ?? this.products,
        isLoading: isLoading ?? this.isLoading);
  }
}
