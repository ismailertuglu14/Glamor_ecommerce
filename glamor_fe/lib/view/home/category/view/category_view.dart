import 'package:client/core/constants/navigation/navigation_constants.dart';
import 'package:client/core/init/navigation/navigation_service.dart';
import 'package:client/view/home/category/cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});
  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.categories?.length ?? 0,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _navigateToSubcategory(context, state, index);
                },
                child: ListTile(
                  //leading: dummyData[index]['icon'],
                  title: Text(state.categories?[index].title ?? ''),
                  trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _navigateToSubcategory(
      BuildContext context, CategoryState state, int index) {
    context
        .read<CategoryCubit>()
        .fetchSubcategories(id: state.categories?[index].id ?? 0)
        .then((_) {
      NavigationService.instance
          .navigateToPage(path: NavigationConstants.SUBCATEGORY);
    });
  }
}
