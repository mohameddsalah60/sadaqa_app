import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadaqa_app/core/utils/app_text_styles.dart';
import 'package:sadaqa_app/core/widgets/custom_text_field.dart';
import 'package:sadaqa_app/features/azkar/presentation/cubits/azkar_category_cubit/azkar_cubit.dart';

import 'azkar_list_bloc_builder.dart';

class AzkarViewBody extends StatefulWidget {
  const AzkarViewBody({super.key});

  @override
  State<AzkarViewBody> createState() => _AzkarViewBodyState();
}

class _AzkarViewBodyState extends State<AzkarViewBody> {
  @override
  void initState() {
    context.read<AzkarCubit>().getAzkarCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('الابواب ومتن الاذكار', style: TextStyles.bold16),
                SizedBox(height: 16.h),
                CustomTextFromField(
                  hintText: 'البحث في الابواب ومتن الاذكار',
                  onChanged: (value) {
                    context.read<AzkarCubit>().searchAzkar(value!);
                  },
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
          AzkarListBlocBuilder(),
        ],
      ),
    );
  }
}
