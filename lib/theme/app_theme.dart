// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum AppTheme {
  dark("dark"),
  light("light");

  final String value;
  const AppTheme(this.value);
}

Map<AppTheme, ThemeData> appTheme = {
  AppTheme.dark: ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: const Color(0XFF65AAEA),
      )),
  AppTheme.light: ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: const Color(0XFFE3562A),
      )),
};

Map<AppTheme, YinColorScheme> appColor = {
  AppTheme.dark: const YinColorScheme.d(),
  AppTheme.light: const YinColorScheme.l(),
};

class YinColorScheme extends Equatable {
  final String name;
  //
  final Color inkDark;
  final Color inkDarkGrey;
  final Color inkGrey;
  final Color inkLightGrey;
  final Color inkWhite;
  final Color primaryColor;
  final Color secondaryColor;
  final Color successColor;
  final Color errorColor;
  final Color warningColor;
  const YinColorScheme({
    required this.name,
    required this.inkDark,
    required this.inkDarkGrey,
    required this.inkGrey,
    required this.inkLightGrey,
    required this.inkWhite,
    required this.primaryColor,
    required this.secondaryColor,
    required this.successColor,
    required this.errorColor,
    required this.warningColor,
  });

  const YinColorScheme.l({
    this.name = "L",
    this.inkDark = const Color(0XFF3C3A36),
    this.inkDarkGrey = const Color(0XFF78746D),
    this.inkGrey = const Color(0XFFBEBAB3),
    this.inkLightGrey = const Color(0XFFF8F2EE),
    this.inkWhite = const Color(0xFFFFFFFF),
    this.primaryColor = const Color(0XFFE3562A),
    this.secondaryColor = const Color(0XFF65AAEA),
    this.successColor = const Color(0XFF5BA092),
    this.errorColor = const Color(0XFFEF4949),
    this.warningColor = const Color(0XFFF2A03F),
  });
  const YinColorScheme.d({
    this.name = "D",
    this.inkDark = const Color(0XFF3C3A36),
    this.inkDarkGrey = const Color(0XFF78746D),
    this.inkGrey = const Color(0XFFBEBAB3),
    this.inkLightGrey = const Color(0XFFF8F2EE),
    this.inkWhite = const Color(0xFFFFFFFF),
    this.primaryColor = const Color(0XFF65AAEA),
    this.secondaryColor = const Color(0XFFE3562A),
    this.successColor = const Color(0XFF5BA092),
    this.errorColor = const Color(0XFFEF4949),
    this.warningColor = const Color(0XFFF2A03F),
  });

  @override
  List<Object> get props {
    return [
      name,
      inkDark,
      inkDarkGrey,
      inkGrey,
      inkLightGrey,
      inkWhite,
      primaryColor,
      secondaryColor,
      successColor,
      errorColor,
      warningColor,
    ];
  }

  YinColorScheme copyWith({
    String? name,
    Color? inkDark,
    Color? inkDarkGrey,
    Color? inkGrey,
    Color? inkLightGrey,
    Color? inkWhite,
    Color? primaryColor,
    Color? secondaryColor,
    Color? successColor,
    Color? errorColor,
    Color? warningColor,
  }) {
    return YinColorScheme(
      name: name ?? this.name,
      inkDark: inkDark ?? this.inkDark,
      inkDarkGrey: inkDarkGrey ?? this.inkDarkGrey,
      inkGrey: inkGrey ?? this.inkGrey,
      inkLightGrey: inkLightGrey ?? this.inkLightGrey,
      inkWhite: inkWhite ?? this.inkWhite,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      successColor: successColor ?? this.successColor,
      errorColor: errorColor ?? this.errorColor,
      warningColor: warningColor ?? this.warningColor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'inkDark': inkDark.value,
      'inkDarkGrey': inkDarkGrey.value,
      'inkGrey': inkGrey.value,
      'inkLightGrey': inkLightGrey.value,
      'inkWhite': inkWhite.value,
      'primaryColor': primaryColor.value,
      'secondaryColor': secondaryColor.value,
      'successColor': successColor.value,
      'errorColor': errorColor.value,
      'warningColor': warningColor.value,
    };
  }

  factory YinColorScheme.fromMap(Map<String, dynamic> map) {
    return YinColorScheme(
      name: map['name'] as String,
      inkDark: Color(map['inkDark'] as int),
      inkDarkGrey: Color(map['inkDarkGrey'] as int),
      inkGrey: Color(map['inkGrey'] as int),
      inkLightGrey: Color(map['inkLightGrey'] as int),
      inkWhite: Color(map['inkWhite'] as int),
      primaryColor: Color(map['primaryColor'] as int),
      secondaryColor: Color(map['secondaryColor'] as int),
      successColor: Color(map['successColor'] as int),
      errorColor: Color(map['errorColor'] as int),
      warningColor: Color(map['warningColor'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory YinColorScheme.fromJson(String source) =>
      YinColorScheme.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
