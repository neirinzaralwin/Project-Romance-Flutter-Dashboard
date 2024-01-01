import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_romance/configs/theme/app_colors.dart';
import 'package:project_romance/core/shared_components/buttons/custom_elevated_button.dart';
import 'package:project_romance/core/shared_components/text_style/custom_text_style.dart';
import 'package:project_romance/features/customer_support/presentation/pages/support/bloc/support_bloc.dart';
import 'package:project_romance/features/customer_support/presentation/pages/support/bloc/support_event.dart';
import 'package:project_romance/features/customer_support/presentation/pages/support/bloc/support_state.dart';
import 'new_contact_dialog.dart';

class SupportContactUsWidget extends StatelessWidget {
  const SupportContactUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      width: 450,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: AppColor.black.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, 3),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Contact information",
            style: headlineSmall.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            "Customers want to contact through",
            style: bodySmall.copyWith(color: AppColor.blueColor),
          ),
          const SizedBox(height: 20),
          BlocBuilder<SupportBloc, SupportState>(builder: (context, state) {
            if (state is AllContactsLoading) {
              return const SizedBox(
                  height: 100,
                  child: Center(child: CupertinoActivityIndicator()));
            }
            if (state is AllContactsSuccess) {
              return SizedBox(
                  height: 100,
                  child: Center(
                      child:
                          Text(state.contacts?.first.name ?? "No contacts")));
            }
            if (state is AllContactsError) {
              return SizedBox(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Row(),
                      Text(state.exception?.message ?? "Something went wrong"),
                      IconButton(
                          onPressed: () => BlocProvider.of<SupportBloc>(context)
                              .add(const GetAllContactsEvent()),
                          icon:
                              const FaIcon(FontAwesomeIcons.arrowRotateRight)),
                    ],
                  ));
            }

            return Container();
          }),
          CustomElevatedButton(
            text: "New",
            icon: Icons.add,
            iconSize: bodyLarge.fontSize,
            color: AppColor.mildGreen,
            textColor: AppColor.black,
            iconColor: AppColor.black,
            verticalPadding: 5,
            borderColor: AppColor.greenColor,
            onPressed: () => _showAddContactDialog(context),
          ),
          const SizedBox(height: 10),
          // ActionTextField(text: "Email", hint: "Email", onDelete: () {}),
          // const SizedBox(height: 10),
        ],
      ),
    );
  }

  void _showAddContactDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const NewContactDialog();
        });
  }
}
