import 'package:flutter/material.dart';
import 'package:project_romance/configs/theme/app_colors.dart';
import 'package:project_romance/core/shared_components/buttons/custom_elevated_button.dart';
import 'package:project_romance/core/shared_components/custom_text_field.dart';
import 'package:project_romance/core/shared_components/drop_downs/custom_search_dropdown.dart';
import 'package:project_romance/core/shared_components/text_style/custom_text_style.dart';
import 'package:project_romance/core/shared_functions/case_extensions.dart';
import 'package:project_romance/features/customer_support/presentation/pages/support/enum/contact_type_enum.dart';
import 'package:project_romance/features/customer_support/presentation/pages/support/ui_models/create_contact_request_model.dart';

class NewContactDialog extends StatefulWidget {
  const NewContactDialog({super.key});

  @override
  State<NewContactDialog> createState() => _NewContactDialogState();
}

class _NewContactDialogState extends State<NewContactDialog> {
  String type = "";
  final contactNameTextController = TextEditingController();
  final contactInfoTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 300,
        width: 300,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text("Contact type", style: bodyMedium),
              const SizedBox(height: 10),
              CustomSearchDropDown(
                items: ContactTypes.values
                    .map((e) => e.name.toTitleCase())
                    .toList(),
                hintColor: AppColor.primaryColor,
                textColor: AppColor.charcoal,
                selectedTextColor: AppColor.greenDark,
                backgroundColor: AppColor.mildWhite,
                noResultFoundText: "No type found",
                hintText: "Select a type",
                onChanged: (value) {
                  setState(() {
                    type = value;
                    contactNameTextController.text = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              Text("Information", style: bodyMedium),
              const SizedBox(height: 10),
              CustomTextFormField(
                text: "Contact name",
                hint: "Contact name",
                controller: contactNameTextController,
                validator: null,
                fillColor: type.isNotEmpty
                    ? AppColor.mildWhite
                    : AppColor.secondaryColor,
                cursorColor: AppColor.primaryColor,
                isEnabled: type.isNotEmpty,
                enableBorder: false,
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                text: "Information",
                hint: "Information",
                controller: contactInfoTextController,
                validator: null,
                fillColor: type.isNotEmpty
                    ? AppColor.mildWhite
                    : AppColor.secondaryColor,
                cursorColor: AppColor.primaryColor,
                isEnabled: type.isNotEmpty,
                enableBorder: false,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        CustomElevatedButton(
            text: "Save",
            onPressed: _save,
            color: AppColor.greenDark,
            textColor: AppColor.white)
      ],
    );
  }

  void _save() {
    final request = CreateContactRequestModel(
        name: contactNameTextController.text,
        value: contactInfoTextController.text,
        contactType: type.toUpperCase());
    _clearValues();
  }

  _clearValues() {
    contactNameTextController.clear();
    contactInfoTextController.clear();
    type = "";
  }
}
