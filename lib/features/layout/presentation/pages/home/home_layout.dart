import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:project_romance/features/layout/presentation/bloc/layout_bloc.dart';
import 'package:project_romance/features/layout/presentation/bloc/layout_event.dart';
import 'package:project_romance/features/layout/presentation/bloc/layout_state.dart';
import '../../../../../core/shared_components/text_style/custom_text_style.dart';
import '../../../../../configs/theme/app_colors.dart';
import '../../../../../di/service_locator.dart';
import 'package:collection/collection.dart';

class HomeLayout extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final List<Widget> children;
  const HomeLayout({
    super.key,
    required this.navigationShell,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocProvider<LayoutBloc>(
      create: (context) =>
          sl<LayoutBloc>()..add(const ChangeSubMenuLayoutEvent(0)),
      child: Scaffold(
        floatingActionButton: (width <= 768)
            ? FloatingActionButton(
                backgroundColor: AppColor.charcoal,
                onPressed: () => [],
                child: const FaIcon(
                  FontAwesomeIcons.bars,
                  color: AppColor.warmWhite,
                ),
              )
            : null,
        body: Row(
          children: [
            LayoutBuilder(
              builder: (context, constraint) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraint.maxHeight),
                    child: IntrinsicHeight(
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: BlocBuilder<LayoutBloc, LayoutState>(
                          builder: (c, state) {
                            return NavigationRail(
                                extended: false,
                                minExtendedWidth: 200,
                                elevation: 20,
                                labelType: NavigationRailLabelType.all,
                                backgroundColor: AppColor.secondaryColor,
                                indicatorColor: AppColor.primaryColor,
                                unselectedIconTheme: IconThemeData(
                                    color: AppColor.charcoal,
                                    opacity: 1,
                                    size: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.fontSize),
                                unselectedLabelTextStyle: labelMedium.copyWith(
                                    color: AppColor.charcoal),
                                selectedLabelTextStyle: labelMedium.copyWith(
                                    color: AppColor.charcoal),
                                selectedIconTheme: IconThemeData(
                                    color: AppColor.warmWhite,
                                    size: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.fontSize),
                                destinations: const [
                                  NavigationRailDestination(
                                    icon: FaIcon(FontAwesomeIcons.tableColumns),
                                    label: Text("Dashboard"),
                                  ),
                                  NavigationRailDestination(
                                    icon: FaIcon(FontAwesomeIcons.box),
                                    label: Text("Inventory"),
                                  ),
                                  // NavigationRailDestination(
                                  //   icon: FaIcon(FontAwesomeIcons.chartLine),
                                  //   label: Text("Reports"),
                                  // ),
                                  // NavigationRailDestination(
                                  //   icon: FaIcon(FontAwesomeIcons.user),
                                  //   label: Text("Users"),
                                  // ),
                                  // NavigationRailDestination(
                                  //   icon: FaIcon(FontAwesomeIcons.screwdriverWrench),
                                  //   label: Text("Settings"),
                                  // ),
                                ],
                                selectedIndex: navigationShell.currentIndex,
                                onDestinationSelected: (newValue) {
                                  navigationShell.goBranch(
                                    newValue,
                                    initialLocation: newValue ==
                                        navigationShell.currentIndex,
                                  );
                                });
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            Expanded(
                child: AnimatedBranchContainer(
              currentIndex: navigationShell.currentIndex,
              children: children,
            )),
          ],
        ),
      ),
    );
  }
}

class AnimatedBranchContainer extends StatelessWidget {
  const AnimatedBranchContainer(
      {super.key, required this.currentIndex, required this.children});
  final int currentIndex;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: children.mapIndexed(
      (int index, Widget navigator) {
        return AnimatedScale(
          scale: index == currentIndex ? 1 : 1.05,
          duration: const Duration(milliseconds: 100),
          child: AnimatedOpacity(
            opacity: index == currentIndex ? 1 : 0,
            duration: const Duration(milliseconds: 200),
            child: _branchNavigatorWrapper(index, navigator),
          ),
        );
      },
    ).toList());
  }

  Widget _branchNavigatorWrapper(int index, Widget navigator) => IgnorePointer(
        ignoring: index != currentIndex,
        child: TickerMode(
          enabled: index == currentIndex,
          child: navigator,
        ),
      );
}
