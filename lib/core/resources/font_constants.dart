import 'dart:ui';
import '../constants/strings.dart';

class FontFamilyManager {
  FontFamilyManager._();
  
  static const String openSans = Strings.openSans;
  static const String ptSans = Strings.ptSans;
}

class FontWeightManager {
  FontWeightManager._();

  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w900;
}
