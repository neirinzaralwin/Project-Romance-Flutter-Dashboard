import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_romance/configs/routes/app_routes.dart';
import 'package:project_romance/features/inventory_management/presentation/pages/category/all_categories/all_categories_screen.dart';
import 'package:project_romance/features/inventory_management/presentation/pages/product/all_products/all_products_screen.dart';
import 'package:project_romance/features/inventory_management/presentation/pages/product/product_detail/product_detail_screen.dart';
import 'package:project_romance/features/layout/presentation/pages/home/home_layout.dart';

import '../../features/guide/welcome/pages/welcome_screen.dart';
import '../transition/fade_transition.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

class AppPages {
  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: "/${AppRoutes.welcome}",
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return HomeLayout(child: child);
        },
        routes: <RouteBase>[
          GoRoute(name: AppRoutes.welcome, path: "/${AppRoutes.welcome}", pageBuilder: (c, s) => fadeTransitionPage(s, const WelcomeScreen())),
          GoRoute(name: AppRoutes.inventory, path: "/${AppRoutes.inventory}", builder: (c, s) => Container(), routes: [
            GoRoute(
                name: AppRoutes.allProduct,
                path: AppRoutes.allProduct,
                pageBuilder: (c, s) => fadeTransitionPage(s, const AllProductScreen()),
                routes: <RouteBase>[
                  GoRoute(name: AppRoutes.productDetail, path: AppRoutes.productDetail, builder: (c, s) => const ProductDetailScreen()),
                ]),
            GoRoute(name: AppRoutes.allCategory, path: AppRoutes.allCategory, pageBuilder: (c, s) => fadeTransitionPage(s, const AllCategoriesScreen()))
          ]),
        ],
      )
    ],
  );
}
