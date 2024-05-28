import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo_list_app/Features/categories_screen/data/Cubit/category_cubit.dart';
import 'package:uptodo_list_app/Features/categories_screen/presentation/widgets/choose_icon_view.dart';
import 'package:uptodo_list_app/Features/categories_screen/presentation/widgets/colors.dart';
import 'package:uptodo_list_app/Widgets/custom_textarea.dart';
import '../../../Core/constants.dart';
import '../../../Widgets/custom_button.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
  listener: (context, state) { },
  builder: (context, state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            tag: 'Category name:',
            keyboardtype: TextInputType.text,
            obsecure: false,
            hint: 'Category name',
          ),
          const SizedBox(height: 20),
          const Text('Category icon:', style: TextStyle(fontSize: 16)),
          const SizedBox(height: 16),
           ChooseIconWidget(),
          const SizedBox(height: 20),
          const Text('Category color:', style: TextStyle(fontSize: 16)),
          const SizedBox(height: 16),
          const SizedBox(
              height: 50,
              child: ColorList()),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(width: 150, height: 48, onPressed: (){}, buttonText: 'Cancel', backgroundColor: Colors.transparent),
              CustomButton(width: 150, height: 48, onPressed: (){}, buttonText: 'Create', backgroundColor: primcolor),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  },
);
  }
}

