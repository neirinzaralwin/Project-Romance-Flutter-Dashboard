import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../bloc/all_product_bloc.dart';
import '../bloc/all_product_event.dart';
import '../bloc/all_product_state.dart';
import 'all_product_list_widget.dart';

class AllProductListView extends StatelessWidget {
  const AllProductListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllProductBloc, AllProductState>(builder: (context, state) {
      if (state is AllProductLoading) {
        return const SliverToBoxAdapter(child: SizedBox(height: 100, child: Center(child: CupertinoActivityIndicator())));
      }
      if (state is AllProductSuccess) {
        return AllProductListWidget(products: state.products ?? []);
      }
      if (state is AllProductError) {
        return SliverToBoxAdapter(
            child: SizedBox(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(state.exception?.message ?? "Something went wrong"),
                    IconButton(
                        onPressed: () => BlocProvider.of<AllProductBloc>(context).add(const GetAllProductsEvent()),
                        icon: const FaIcon(FontAwesomeIcons.arrowRotateRight)),
                  ],
                )));
      }
      return Container();
    });
  }
}
