import 'package:bloc/bloc.dart';
import 'package:client/view/home/feed/model/product_model.dart';
import 'package:client/view/home/feed/service/IProductService.dart';
import 'package:equatable/equatable.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final IProductService productService;
  ProductsCubit(this.productService) : super(const ProductsState()) {
    initialComplete();
  }

  Future<void> fetchAllProducts() async {
    _changeLoading();
    final response = await productService.fetchAllProducts();
    emit(state.copyWith(products: response ?? []));
    _changeLoading();
  }

  Future<void> fetchProductsByQuery() async {
    _changeLoading();
    // todo: Get Product List by selected category's query
    _changeLoading();
  }

  void _changeLoading() {
    Future.delayed(const Duration(seconds: 1)).then(
        (_) => emit(state.copyWith(isLoading: !(state.isLoading ?? false))));
  }

  /*  Lazy Loading fetch products*/
  void fetchNewProducts() async {
    if (state.isLoading ?? false) {
      return;
    }
    _changeLoading();
    int count = (state.productCount ?? 1);
    final response = await productService.fetchAllProducts(count: ++count * 5);
    _changeLoading();

    emit(state.copyWith(products: response, productCount: count));
  }

  Future<void> initialComplete() async {
    await Future.microtask(() {
      emit(const ProductsState(isInitial: true));
    });
    await Future.wait([
      fetchAllProducts(),
    ]);
  }
}
