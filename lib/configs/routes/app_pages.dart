import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_romance/configs/routes/app_routes.dart';
import 'package:project_romance/features/inventory_management/presentation/pages/product/all_products/all_products_screen.dart';
import 'package:project_romance/features/inventory_management/presentation/pages/product/product_detail/product_detail_screen.dart';
import 'package:project_romance/features/layout/presentation/pages/home/home_layout.dart';
import 'package:project_romance/features/layout/presentation/pages/home/sub_menu_widgets/inventory_sub_menu.dart';
import 'package:project_romance/features/support/presentation/pages/support_layout.dart';

import '../../features/guide/welcome/pages/welcome_screen.dart';
import '../../features/inventory_management/presentation/pages/category/all_categories/all_categories_screen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

class AppPages {
  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: "/${AppRoutes.welcome}",
    debugLogDiagnostics: false,
    routes: <RouteBase>[
      StatefulShellRoute(
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return navigationShell;
        },
        navigatorContainerBuilder: (BuildContext context,
            StatefulNavigationShell navigationShell, List<Widget> children) {
          return HomeLayout(
              navigationShell: navigationShell, children: children);
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: shellNavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                name: AppRoutes.welcome,
                path: "/${AppRoutes.welcome}",
                builder: (BuildContext context, GoRouterState state) =>
                    const WelcomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              StatefulShellRoute(
                  builder: (BuildContext context, GoRouterState state,
                      StatefulNavigationShell navigationShell) {
                    return navigationShell;
                  },
                  navigatorContainerBuilder: (BuildContext context,
                      StatefulNavigationShell navigationShell,
                      List<Widget> children) {
                    return InventorySubMenu(
                        navigationShell: navigationShell, children: children);
                  },
                  branches: [
                    StatefulShellBranch(routes: [
                      GoRoute(
                        name: AppRoutes.allProducts,
                        path: '/${AppRoutes.allProducts}',
                        builder: (BuildContext context, GoRouterState state) {
                          return const AllProductScreen();
                        },
                        routes: <RouteBase>[
                          GoRoute(
                            name: AppRoutes.productDetail,
                            path: AppRoutes.productDetail,
                            builder:
                                (BuildContext context, GoRouterState state) =>
                                    const ProductDetailScreen(),
                          ),
                        ],
                      ),
                    ]),
                    StatefulShellBranch(routes: [
                      GoRoute(
                        name: AppRoutes.allCategory,
                        path: '/${AppRoutes.allCategory}',
                        builder: (BuildContext context, GoRouterState state) {
                          return const AllCategoriesScreen();
                        },
                      ),
                    ])
                  ]),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: shellNavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                name: AppRoutes.support,
                path: "/${AppRoutes.support}",
                builder: (BuildContext context, GoRouterState state) =>
                    const SupportLayout(),
              ),
            ],
          ),
        ],
      )
    ],
  );
}
