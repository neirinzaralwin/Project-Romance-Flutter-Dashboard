import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:project_romance/configs/dimension/dimension_manager.dart';
import 'package:project_romance/configs/theme/app_colors.dart';
import 'package:project_romance/core/shared_components/buttons/custom_elevated_button.dart';
import 'package:project_romance/core/shared_components/text_style/custom_text_style.dart';
import 'package:project_romance/di/service_locator.dart';
import 'package:project_romance/features/customer_support/presentation/pages/support/widgets/about_us/bloc/about_us_bloc.dart';

class SupportAboutUsWidget extends StatefulWidget {
  const SupportAboutUsWidget({super.key});

  @override
  State<SupportAboutUsWidget> createState() => _SupportAboutUsWidgetState();
}

class _SupportAboutUsWidgetState extends State<SupportAboutUsWidget> {
  final controller = HtmlEditorController();
  late AboutUsBloc currentBloc;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider<AboutUsBloc>(
      create: (context) {
        return sl<AboutUsBloc>()..add(const GetAboutUsEvent());
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal:
                (screenWidth > DM.tabletview) ? screenWidth * 0.1 : 15.0),
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
                  "Description",
                  style: headlineSmall.copyWith(fontWeight: FontWeight.bold),
                ),
                CustomElevatedButton(
                    width: 120,
                    height: 50,
                    text: "Save",
                    isDisabled: false,
                    onPressed: _save,
                    color: AppColor.greenDark,
                    textColor: AppColor.white),
              ],
            ),
            Text(
              "Description about us",
              style: bodySmall.copyWith(color: AppColor.blueColor),
            ),
            const SizedBox(height: 10),
            BlocBuilder<AboutUsBloc, AboutUsState>(builder: (context, state) {
              currentBloc = BlocProvider.of<AboutUsBloc>(context);
              if (state is AboutUsLoading) {
                return const SizedBox(
                    height: 400.0,
                    child: Center(child: CupertinoActivityIndicator()));
              }
              if (state is AboutUsError) {
                return SizedBox(
                    height: 400.0,
                    child: Center(
                      child: Text(
                          state.exception?.message ?? "Something went wrong"),
                    ));
              }
              if (state is AboutUsSuccess) {
                return HtmlEditor(
                  controller: controller, //required
                  htmlEditorOptions: HtmlEditorOptions(
                      hint: "Describe your shop...",
                      initialText: state.aboutUs?.text ?? ""),
                );
              }

              return Container();
            }),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void _save() async {
    String description = await controller.getText();
    if (description.isNotEmpty) {
      currentBloc.add(UpdateAboutUsEvent(description));
    }
  }
}
