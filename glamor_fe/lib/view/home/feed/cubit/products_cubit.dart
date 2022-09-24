import 'package:bloc/bloc.dart';
import 'package:client/view/home/feed/model/product_model.dart';
import 'package:client/view/home/feed/service/IProductService.dart';
import 'package:equatable/equatable.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final IProductService productService;
  ProductsCubit(this.productService) : super(const ProductsState()) {
    fetchAllProducts();
  }

  void fetchAllProducts() async {
    _changeLoading();
    final response = await productService.fetchAllProducts();
    emit(state.copyWith(products: response ?? []));
    _changeLoading();
  }

  void _changeLoading() {
    emit(state.copyWith(isLoading: !(state.isLoading ?? false)));
  }
}
