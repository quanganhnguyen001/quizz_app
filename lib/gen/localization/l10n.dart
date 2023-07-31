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

class Str {
  Str();

  static Str? _current;

  static Str get current {
    assert(_current != null,
        'No instance of Str was loaded. Try to initialize the Str delegate before accessing Str.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Str> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Str();
      Str._current = instance;

      return instance;
    });
  }

  static Str of(BuildContext context) {
    final instance = Str.maybeOf(context);
    assert(instance != null,
        'No instance of Str present in the widget tree. Did you add Str.delegate in localizationsDelegates?');
    return instance!;
  }

  static Str? maybeOf(BuildContext context) {
    return Localizations.of<Str>(context, Str);
  }

  /// `Học mọi lúc \nvà mọi nơi`
  String get onboardTitle1 {
    return Intl.message(
      'Học mọi lúc \nvà mọi nơi',
      name: 'onboardTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Tìm khóa học \ncho bạn`
  String get onboardTitle2 {
    return Intl.message(
      'Tìm khóa học \ncho bạn',
      name: 'onboardTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Cải thiện kỹ năng của bạn`
  String get onboardTitle3 {
    return Intl.message(
      'Cải thiện kỹ năng của bạn',
      name: 'onboardTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Cách ly là thời điểm hoàn hảo để dành \nngày của bạn để học điều gì đó mới, từ mọi nơi!`
  String get onboardLabel {
    return Intl.message(
      'Cách ly là thời điểm hoàn hảo để dành \nngày của bạn để học điều gì đó mới, từ mọi nơi!',
      name: 'onboardLabel',
      desc: '',
      args: [],
    );
  }

  /// `Tiếp tục`
  String get next {
    return Intl.message(
      'Tiếp tục',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Bắt đầu`
  String get start {
    return Intl.message(
      'Bắt đầu',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Bỏ qua`
  String get skip {
    return Intl.message(
      'Bỏ qua',
      name: 'skip',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Str> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'vi'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Str> load(Locale locale) => Str.load(locale);
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
