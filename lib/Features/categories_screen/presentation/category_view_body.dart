import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo_list_app/Features/categories_screen/data/Cubit/category_cubit.dart';
import 'package:uptodo_list_app/Features/categories_screen/presentation/widgets/choose_icon_view.dart';
import 'package:uptodo_list_app/Features/categories_screen/presentation/widgets/colors.dart';
import 'package:uptodo_list_app/Widgets/custom_dialog.dart';
import 'package:uptodo_list_app/Widgets/custom_textarea.dart';

import '../../../Core/constants.dart';
import '../../../Widgets/custom_button.dart';

class CategoryViewBody extends StatelessWidget {
  CategoryViewBody({
    super.key,
  });

  var categorycontroller = TextEditingController();

  // final GlobalKey<FormState> formKey;
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {
        if (state is CreateCategoryError) {
          showDialog(
              context: context,
              builder: (context) => CustomDialog(
                    alerttitle: state.errorTitle,
                    alerttext: state.errorMsg,
                  ));
        } else if (state is CreateCategorySuccess) {
          showDialog(
              context: context,
              builder: (context) => CustomDialog(
                  alerttitle: state.successTitle, alerttext: state.successMsg));
        }
      },
      builder: (context, state) {
        var cubit = CategoryCubit.get(context);
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: formkey,
                  child: CustomTextField(
                      preicon: Icons.text_snippet_outlined,
                      tag: 'Category name:',
                      keyboardtype: TextInputType.text,
                      obsecure: false,
                      hint: 'Enter Category name',
                      textEditingController: categorycontroller),
                ),
                const Text('Category icon:', style: TextStyle(fontSize: 16)),
                const SizedBox(height: 16),
                ChooseIconWidget(),
                const SizedBox(height: 20),
                const Text('Category color:', style: TextStyle(fontSize: 16)),
                const SizedBox(height: 16),
                const SizedBox(height: 50, child: ColorList()),
                SizedBox(height:MediaQuery.sizeOf(context).height*.27),
                CustomButton(
                    width: double.infinity,
                    height: 48,
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        cubit.createCategory(
                            catColor: cubit.choosedcolor,
                            catIcon: cubit.choosedicon,
                            catName: categorycontroller.text);
                      }
                    },
                    buttonText: 'Create Category',
                    backgroundColor: primcolor),

              ],
            ),
          ),
        );
      },
    );
  }
}
