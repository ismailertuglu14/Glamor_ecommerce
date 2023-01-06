import 'package:bloc/bloc.dart';
import 'package:client/view/home/category/models/category_model.dart';
import 'package:client/view/home/category/models/subcategory_model.dart';
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

  Future<void> fetchSubcategories({required int id}) async {
    final response = await categoryService.fetchSubcategories(id: id);

    emit(state.copyWith(subcategories: response ?? []));
  }
  //Future<void> fetchAllSubCategories() async{}

  Future<void> initialComplete() async {
    await Future.microtask(() {
      fetchAllCategories();
    });
  }
}
