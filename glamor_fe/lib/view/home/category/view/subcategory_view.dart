// ignore_for_file: must_be_immutable
import 'package:client/view/home/category/cubit/category_cubit.dart';
import 'package:client/view/home/category/models/subcategory_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubCategoryView extends StatefulWidget {
  List<Subcategories>? subCategories;
  SubCategoryView({super.key, this.subCategories});
  @override
  State<SubCategoryView> createState() => _SubCategoryViewState();
}

class _SubCategoryViewState extends State<SubCategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.subcategories?.length ?? 0,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context
                      .read<CategoryCubit>()
                      .fetchSubcategories(id: 1)
                      .then((_) {});
                },
                child: ListTile(
                  //leading: dummyData[index]['icon'],
                  title: Text(state.subcategories?[index].title ?? ''),
                  trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
