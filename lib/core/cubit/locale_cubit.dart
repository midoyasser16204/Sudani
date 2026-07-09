import 'dart:ui';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../constants/strings.dart';

class LocaleCubit extends HydratedCubit<Locale> {
  LocaleCubit() : super(const Locale(Strings.eng));

  void setLocale(Locale locale) {
    emit(locale);
  }

  void toggleLocale() {
    final newLocale = state.languageCode == Strings.eng
        ? const Locale(Strings.arb)
        : const Locale(Strings.eng);
    emit(newLocale);
  }

  bool get isEnglish => state.languageCode == Strings.eng;
  bool get isArabic => state.languageCode == Strings.arb;

  @override
  Locale? fromJson(Map<String, dynamic> json) {
    return Locale(json[Strings.languageCode] as String);
  }

  @override
  Map<String, dynamic>? toJson(Locale state) {
    return {Strings.languageCode: state.languageCode};
  }
}
