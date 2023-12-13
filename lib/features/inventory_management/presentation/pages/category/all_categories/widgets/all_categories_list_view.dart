import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_romance/features/inventory_management/presentation/pages/category/all_categories/bloc/all_category_bloc.dart';
import 'package:project_romance/features/inventory_management/presentation/pages/category/all_categories/bloc/all_category_event.dart';
import 'package:project_romance/features/inventory_management/presentation/pages/category/all_categories/bloc/all_category_state.dart';

import 'all_category_list_widget.dart';

class AllCategoryListView extends StatelessWidget {
  const AllCategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCategoryBloc, AllCategoryState>(builder: (context, state) {
      if (state is AllCategoryLoading) {
        return const SliverToBoxAdapter(child: SizedBox(height: 100, child: Center(child: CupertinoActivityIndicator())));
      }
      if (state is AllCategorySuccess) {
        return AllCategoryListWidget(categories: state.paginatedAllCategories?.data ?? []);
      }
      if (state is AllCategoryError) {
        return SliverToBoxAdapter(
            child: SizedBox(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(state.exception?.message ?? "Something went wrong"),
                    IconButton(
                        onPressed: () => BlocProvider.of<AllCategoryBloc>(context).add(const GetAllCategoryEvent()),
                        icon: const FaIcon(FontAwesomeIcons.arrowRotateRight)),
                  ],
                )));
      }
      return Container();
    });
  }
}
