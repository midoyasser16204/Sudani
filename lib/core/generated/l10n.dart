// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `العربية`
  String get language {
    return Intl.message('العربية', name: 'language', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Announcements`
  String get announcements {
    return Intl.message(
      'Announcements',
      name: 'announcements',
      desc: '',
      args: [],
    );
  }

  /// `Asma Hamrawy got promoted to UX Team Lead!`
  String get announcementsHeader {
    return Intl.message(
      'Asma Hamrawy got promoted to UX Team Lead!',
      name: 'announcementsHeader',
      desc: '',
      args: [],
    );
  }

  /// `Congratulate Asma Hamrawy for her recent promotion from Senior UX Designer to UX Team Lead.`
  String get announcementsDetail {
    return Intl.message(
      'Congratulate Asma Hamrawy for her recent promotion from Senior UX Designer to UX Team Lead.',
      name: 'announcementsDetail',
      desc: '',
      args: [],
    );
  }

  /// `17 Monday, February 2025`
  String get announcementsDate {
    return Intl.message(
      '17 Monday, February 2025',
      name: 'announcementsDate',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `Hello Mohamed`
  String get helloMohamed {
    return Intl.message(
      'Hello Mohamed',
      name: 'helloMohamed',
      desc: '',
      args: [],
    );
  }

  /// `Development Team`
  String get developmentTeam {
    return Intl.message(
      'Development Team',
      name: 'developmentTeam',
      desc: '',
      args: [],
    );
  }

  /// `Check-out Time`
  String get checkOutTime {
    return Intl.message(
      'Check-out Time',
      name: 'checkOutTime',
      desc: '',
      args: [],
    );
  }

  /// `9:32 AM`
  String get time {
    return Intl.message('9:32 AM', name: 'time', desc: '', args: []);
  }

  /// `Not yet`
  String get notRegisteredYet {
    return Intl.message(
      'Not yet',
      name: 'notRegisteredYet',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get pending {
    return Intl.message('Pending', name: 'pending', desc: '', args: []);
  }

  /// `Check-in Time`
  String get checkInTime {
    return Intl.message(
      'Check-in Time',
      name: 'checkInTime',
      desc: '',
      args: [],
    );
  }

  /// `On Time`
  String get onTime {
    return Intl.message('On Time', name: 'onTime', desc: '', args: []);
  }

  /// `Check out`
  String get registerCheckOut {
    return Intl.message(
      'Check out',
      name: 'registerCheckOut',
      desc: '',
      args: [],
    );
  }

  /// `Emergency Balance`
  String get emergencyBalance {
    return Intl.message(
      'Emergency Balance',
      name: 'emergencyBalance',
      desc: '',
      args: [],
    );
  }

  /// `Regular Balance`
  String get regularBalance {
    return Intl.message(
      'Regular Balance',
      name: 'regularBalance',
      desc: '',
      args: [],
    );
  }

  /// `Days`
  String get days {
    return Intl.message('Days', name: 'days', desc: '', args: []);
  }

  /// `Welcome back! Please login to continue`
  String get welcomeBack {
    return Intl.message(
      'Welcome back! Please login to continue',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailTitle {
    return Intl.message('Email', name: 'emailTitle', desc: '', args: []);
  }

  /// `Enter your email`
  String get emailHint {
    return Intl.message(
      'Enter your email',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordTitle {
    return Intl.message('Password', name: 'passwordTitle', desc: '', args: []);
  }

  /// `Enter your password`
  String get passwordHint {
    return Intl.message(
      'Enter your password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get or {
    return Intl.message('OR', name: 'or', desc: '', args: []);
  }

  /// `Login with Google`
  String get loginWithGoogle {
    return Intl.message(
      'Login with Google',
      name: 'loginWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Out of Boundaries!`
  String get outOfBoundaries {
    return Intl.message(
      'Out of Boundaries!',
      name: 'outOfBoundaries',
      desc: '',
      args: [],
    );
  }

  /// `Add justification for your current location.`
  String get addJustification {
    return Intl.message(
      'Add justification for your current location.',
      name: 'addJustification',
      desc: '',
      args: [],
    );
  }

  /// `Write your justification here....`
  String get writeJustification {
    return Intl.message(
      'Write your justification here....',
      name: 'writeJustification',
      desc: '',
      args: [],
    );
  }

  /// `Incomplete working hours!`
  String get incompleteWorkingHours {
    return Intl.message(
      'Incomplete working hours!',
      name: 'incompleteWorkingHours',
      desc: '',
      args: [],
    );
  }

  /// `Early Checkout!`
  String get earlyCheckout {
    return Intl.message(
      'Early Checkout!',
      name: 'earlyCheckout',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Checkout`
  String get confirmCheckout {
    return Intl.message(
      'Confirm Checkout',
      name: 'confirmCheckout',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Are you sure you want to logout?`
  String get logoutConfirm {
    return Intl.message(
      'Are you sure you want to logout?',
      name: 'logoutConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Please enter your email`
  String get validatorEmailEmpty {
    return Intl.message(
      'Please enter your email',
      name: 'validatorEmailEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get validatorPasswordEmpty {
    return Intl.message(
      'Please enter your password',
      name: 'validatorPasswordEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your new password`
  String get validatorNewPasswordEmpty {
    return Intl.message(
      'Please enter your new password',
      name: 'validatorNewPasswordEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email address`
  String get validatorEmailInvalid {
    return Intl.message(
      'Enter a valid email address',
      name: 'validatorEmailInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters long`
  String get validatorPasswordTooShort {
    return Intl.message(
      'Password must be at least 8 characters long',
      name: 'validatorPasswordTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one lowercase letter`
  String get validatorPasswordNoLowercase {
    return Intl.message(
      'Password must contain at least one lowercase letter',
      name: 'validatorPasswordNoLowercase',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one number`
  String get validatorPasswordNoNumber {
    return Intl.message(
      'Password must contain at least one number',
      name: 'validatorPasswordNoNumber',
      desc: '',
      args: [],
    );
  }

  /// `h`
  String get h {
    return Intl.message('h', name: 'h', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
