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
import '../enum/contact_type_enum.dart';
import 'new_contact_dialog.dart';
import 'support_action_text_field.dart';

class SupportContactUsWidget extends StatefulWidget {
  const SupportContactUsWidget({super.key});

  @override
  State<SupportContactUsWidget> createState() => _SupportContactUsWidgetState();
}

class _SupportContactUsWidgetState extends State<SupportContactUsWidget> {
  late SupportBloc currentBloc;
  bool canEdit = false;
  bool canSave = false;
  late int? currentFocusIndex;
  late int? currentFocusId;
  String changedValue = "";

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Contact information",
                style: headlineSmall.copyWith(fontWeight: FontWeight.bold),
              ),
              IconButton.filledTonal(
                  onPressed: () {
                    _showAddContactDialog(context, currentBloc);
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.circlePlus,
                    color: AppColor.greenDark,
                  ))
            ],
          ),
          Text(
            "Customers want to contact through",
            style: bodySmall.copyWith(color: AppColor.blueColor),
          ),
          const SizedBox(height: 20),
          BlocBuilder<SupportBloc, SupportState>(builder: (context, state) {
            currentBloc = BlocProvider.of<SupportBloc>(context);
            if (state is AllContactsLoading) {
              return const SizedBox(
                  height: 100,
                  child: Center(child: CupertinoActivityIndicator()));
            }
            if (state is AllContactsSuccess) {
              if (state.contacts!.isNotEmpty) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.contacts?.length,
                    itemBuilder: (context, index) {
                      var contact = state.contacts![index];
                      bool isThisFieldEnable =
                          (canEdit == true && currentFocusIndex == index);

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ActionTextField(
                          isDisable: !isThisFieldEnable,
                          icon: contactTypeMapper(contact.contactType),
                          text: contact.name ?? "",
                          hint: contact.name ?? "",
                          value: contact.value ?? "",
                          onPressed: () {
                            // some field is editing need to save
                            if (!canSave) {
                              setState(() {
                                currentFocusIndex = index;
                                currentFocusId = contact.id ?? 0;
                                canEdit = true;
                              });
                            }
                          },
                          onDelete: () {
                            if (!canSave) {
                              currentBloc
                                  .add(DeleteContactEvent(contact.id ?? 0));
                            }
                          },
                          onChanged: (newValue) {
                            if (newValue != contact.value) {
                              setState(() {
                                changedValue = newValue;
                                canSave = true;
                              });
                            }
                          },
                        ),
                      );
                    });
              }
              return SizedBox(
                height: 100,
                child: Center(child: Text("No contact yet", style: bodyMedium)),
              );
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
                          onPressed: () =>
                              currentBloc.add(const GetAllContactsEvent()),
                          icon:
                              const FaIcon(FontAwesomeIcons.arrowRotateRight)),
                    ],
                  ));
            }

            return Container();
          }),
          CustomElevatedButton(
              text: "Save",
              isDisabled: !canSave,
              onPressed: _onsave,
              color: AppColor.greenDark,
              textColor: AppColor.white),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  void _showAddContactDialog(context, currentBloc) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return NewContactDialog(bloc: currentBloc);
        });
  }

  void _onsave() {
    currentBloc.add(UpdateContactEvent(currentFocusId!, changedValue));
    setState(() {
      canEdit = false;
      canSave = false;
      currentFocusIndex = null;
      currentFocusId = null;
      changedValue = "";
    });
  }
}
