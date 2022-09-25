import 'package:bloc/bloc.dart';
import 'package:client/view/home/category/service/ICategoryService.dart';
import 'package:equatable/equatable.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final ICategoryService categoryService;
  CategoryCubit(this.categoryService) : super(const CategoryState()) {
    initialComplete();
  }

  Future<void> fetchAllCategories() async {
    final response = await categoryService.fetchAllCategories();
    emit(state.copyWith(categories: response));
  }
  //Future<void> fetchAllSubCategories() async{}

  Future<void> initialComplete() async {
    await Future.microtask(() {
      fetchAllCategories();
    });
  }
}
