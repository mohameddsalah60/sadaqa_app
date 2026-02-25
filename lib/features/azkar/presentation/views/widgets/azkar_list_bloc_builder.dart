import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/azkar_category_cubit/azkar_cubit.dart';
import '../zekr_view.dart';
import 'custom_azkar_button.dart';

class AzkarListBlocBuilder extends StatelessWidget {
  const AzkarListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AzkarCubit, AzkarState>(
      builder: (context, state) {
        if (state is AzkarLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is AzkarFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errorMessage)),
          );
        } else if (state is AzkarSuccess) {
          return SliverList.builder(
            itemCount: state.categories.length,
            itemBuilder: (context, index) {
              final category = state.categories[index];
              return CustomAzkarButton(
                azkarName: category.name,
                azkarIcon: category.categoryIcons[category.name] ?? Icons.book,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    ZekrView.routeName,
                    arguments: category,
                  );
                },
              );
            },
          );
        } else {
          return const SliverToBoxAdapter(child: SizedBox());
        }
      },
    );
  }
}
