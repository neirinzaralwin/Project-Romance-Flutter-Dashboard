import 'package:flutter/material.dart';
import 'package:project_romance/configs/routes/app_pages.dart';

const mainFontName = "sfpro";
BuildContext? context = rootNavigatorKey.currentContext;

final TextStyle headlineLarge = Theme.of(context!).textTheme.headlineLarge!.copyWith(fontFamily: mainFontName);
final TextStyle headlineMedium = Theme.of(context!).textTheme.headlineMedium!.copyWith(fontFamily: mainFontName);
final TextStyle headlineSmall = Theme.of(context!).textTheme.headlineSmall!.copyWith(fontFamily: mainFontName);

final TextStyle bodyLarge = Theme.of(context!).textTheme.bodyLarge!.copyWith(fontFamily: mainFontName);
final TextStyle bodyMedium = Theme.of(context!).textTheme.bodyMedium!.copyWith(fontFamily: mainFontName);
final TextStyle bodySmall = Theme.of(context!).textTheme.bodySmall!.copyWith(fontFamily: mainFontName);

// final TextStyle labelLarge = Theme.of(context!).textTheme.labelLarge!;
final TextStyle labelLarge = Theme.of(context!).textTheme.labelLarge!.copyWith(fontFamily: mainFontName);
final TextStyle labelMedium = Theme.of(context!).textTheme.labelMedium!.copyWith(fontFamily: mainFontName);
final TextStyle labelSmall = Theme.of(context!).textTheme.labelSmall!.copyWith(fontFamily: mainFontName);
