import 'dart:ui' as ui;

import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:google_fonts/src/google_fonts_base.dart';
// ignore: implementation_imports
import 'package:google_fonts/src/google_fonts_descriptor.dart';
// ignore: implementation_imports
import 'package:google_fonts/src/google_fonts_variant.dart';

class CustomGoogleFont extends GoogleFontsFile {
  final String downloadUrl;

  CustomGoogleFont(this.downloadUrl, super.expectedFileHash, super.expectedLength);

  @override
  String get url => downloadUrl;
}

class CustomGoogleFonts {
  // static TextStyle diphylleia({
  //   TextStyle? textStyle,
  //   Color? color,
  //   Color? backgroundColor,
  //   double? fontSize,
  //   FontWeight? fontWeight,
  //   FontStyle? fontStyle,
  //   double? letterSpacing,
  //   double? wordSpacing,
  //   TextBaseline? textBaseline,
  //   double? height,
  //   Locale? locale,
  //   Paint? foreground,
  //   Paint? background,
  //   List<ui.Shadow>? shadows,
  //   List<ui.FontFeature>? fontFeatures,
  //   TextDecoration? decoration,
  //   Color? decorationColor,
  //   TextDecorationStyle? decorationStyle,
  //   double? decorationThickness,
  // }) {
  //   final fonts = <GoogleFontsVariant, GoogleFontsFile>{
  //     const GoogleFontsVariant(
  //       fontWeight: FontWeight.w400,
  //       fontStyle: FontStyle.normal,
  //     ): CustomGoogleFont(
  //       'https://fonts.gstatic.com/s/diphylleia/v1/DtVmJxCtRKMixK4_HXsIulwm6gDXvwE.ttf',
  //       '7027babd4e46661d27d30bc5b26813ade04879df60566796aa06d5d6f51f15c5',
  //       1942984,
  //     ),
  //   };

  //   return googleFontsTextStyle(
  //     textStyle: textStyle,
  //     fontFamily: 'Diphylleia',
  //     color: color,
  //     backgroundColor: backgroundColor,
  //     fontSize: fontSize,
  //     fontWeight: fontWeight,
  //     fontStyle: fontStyle,
  //     letterSpacing: letterSpacing,
  //     wordSpacing: wordSpacing,
  //     textBaseline: textBaseline,
  //     height: height,
  //     locale: locale,
  //     foreground: foreground,
  //     background: background,
  //     shadows: shadows,
  //     fontFeatures: fontFeatures,
  //     decoration: decoration,
  //     decorationColor: decorationColor,
  //     decorationStyle: decorationStyle,
  //     decorationThickness: decorationThickness,
  //     fonts: fonts,
  //   );
  // }

  // /// Applies the Ubuntu font family from Google Fonts to every
  // /// [TextStyle] in the given [textTheme].
  // ///
  // /// See:
  // ///  * https://fonts.google.com/specimen/Diphylleia
  // static TextTheme diphylleiaTextTheme([TextTheme? textTheme]) {
  //   textTheme ??= ThemeData.light().textTheme;
  //   return TextTheme(
  //     displayLarge: diphylleia(textStyle: textTheme.displayLarge),
  //     displayMedium: diphylleia(textStyle: textTheme.displayMedium),
  //     displaySmall: diphylleia(textStyle: textTheme.displaySmall),
  //     headlineLarge: diphylleia(textStyle: textTheme.headlineLarge),
  //     headlineMedium: diphylleia(textStyle: textTheme.headlineMedium),
  //     headlineSmall: diphylleia(textStyle: textTheme.headlineSmall),
  //     titleLarge: diphylleia(textStyle: textTheme.titleLarge),
  //     titleMedium: diphylleia(textStyle: textTheme.titleMedium),
  //     titleSmall: diphylleia(textStyle: textTheme.titleSmall),
  //     bodyLarge: diphylleia(textStyle: textTheme.bodyLarge),
  //     bodyMedium: diphylleia(textStyle: textTheme.bodyMedium),
  //     bodySmall: diphylleia(textStyle: textTheme.bodySmall),
  //     labelLarge: diphylleia(textStyle: textTheme.labelLarge),
  //     labelMedium: diphylleia(textStyle: textTheme.labelMedium),
  //     labelSmall: diphylleia(textStyle: textTheme.labelSmall),
  //   );
  // }

  // static TextStyle notoSans({
  //   TextStyle? textStyle,
  //   Color? color,
  //   Color? backgroundColor,
  //   double? fontSize,
  //   FontWeight? fontWeight,
  //   FontStyle? fontStyle,
  //   double? letterSpacing,
  //   double? wordSpacing,
  //   TextBaseline? textBaseline,
  //   double? height,
  //   Locale? locale,
  //   Paint? foreground,
  //   Paint? background,
  //   List<ui.Shadow>? shadows,
  //   List<ui.FontFeature>? fontFeatures,
  //   TextDecoration? decoration,
  //   Color? decorationColor,
  //   TextDecorationStyle? decorationStyle,
  //   double? decorationThickness,
  // }) {
  //   final fonts = <GoogleFontsVariant, GoogleFontsFile>{
  //     const GoogleFontsVariant(
  //       fontWeight: FontWeight.w400,
  //       fontStyle: FontStyle.normal,
  //     ): CustomGoogleFont(
  //       'https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap',
  //       'd0f7c9a59a35b57ab54229e72dcb2a1cf2e53d3a87fc362ea014f50c1f8cf6ea',
  //       123456,
  //     ),
  //     // Add more variants if needed
  //   };

  //   return googleFontsTextStyle(
  //     textStyle: textStyle,
  //     fontFamily: 'NotoSans',
  //     color: color,
  //     backgroundColor: backgroundColor,
  //     fontSize: fontSize,
  //     fontWeight: fontWeight,
  //     fontStyle: fontStyle,
  //     letterSpacing: letterSpacing,
  //     wordSpacing: wordSpacing,
  //     textBaseline: textBaseline,
  //     height: height,
  //     locale: locale,
  //     foreground: foreground,
  //     background: background,
  //     shadows: shadows,
  //     fontFeatures: fontFeatures,
  //     decoration: decoration,
  //     decorationColor: decorationColor,
  //     decorationStyle: decorationStyle,
  //     decorationThickness: decorationThickness,
  //     fonts: fonts,
  //   );
  // }

  // static TextTheme notoSansTextTheme([TextTheme? textTheme]) {
  //   textTheme ??= ThemeData.light().textTheme;
  //   return TextTheme(
  //     displayLarge: notoSans(textStyle: textTheme.displayLarge),
  //     displayMedium: notoSans(textStyle: textTheme.displayMedium),
  //     displaySmall: notoSans(textStyle: textTheme.displaySmall),
  //     headlineLarge: notoSans(textStyle: textTheme.headlineLarge),
  //     headlineMedium: notoSans(textStyle: textTheme.headlineMedium),
  //     headlineSmall: notoSans(textStyle: textTheme.headlineSmall),
  //     titleLarge: notoSans(textStyle: textTheme.titleLarge),
  //     titleMedium: notoSans(textStyle: textTheme.titleMedium),
  //     titleSmall: notoSans(textStyle: textTheme.titleSmall),
  //     bodyLarge: notoSans(textStyle: textTheme.bodyLarge),
  //     bodyMedium: notoSans(textStyle: textTheme.bodyMedium),
  //     bodySmall: notoSans(textStyle: textTheme.bodySmall),
  //     labelLarge: notoSans(textStyle: textTheme.labelLarge),
  //     labelMedium: notoSans(textStyle: textTheme.labelMedium),
  //     labelSmall: notoSans(textStyle: textTheme.labelSmall),
  //   );
  // }
}
