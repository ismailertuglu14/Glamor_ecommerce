import 'package:client/view/home/feed/cubit/products_cubit.dart';
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
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.categories?.length ?? 0,
            itemBuilder: (context, index) {
              return ListTile(
                //leading: dummyData[index]['icon'],
                title: Text(state.categories?[index] ?? ''),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              );
            },
          );
        },
      ),
    );
  }
}
