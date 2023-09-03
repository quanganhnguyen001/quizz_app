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

  /// `OD CodeFactory`
  String get appName {
    return Intl.message(
      'OD CodeFactory',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Ngôn ngữ`
  String get language {
    return Intl.message(
      'Ngôn ngữ',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `THỬ NGHIỆM UI`
  String get uiTesting {
    return Intl.message(
      'THỬ NGHIỆM UI',
      name: 'uiTesting',
      desc: '',
      args: [],
    );
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

  /// `Đăng nhập`
  String get login {
    return Intl.message(
      'Đăng nhập',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Đăng nhập với mạng xã hội`
  String get social_login {
    return Intl.message(
      'Đăng nhập với mạng xã hội',
      name: 'social_login',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập đúng định dạng email`
  String get valid_email {
    return Intl.message(
      'Vui lòng nhập đúng định dạng email',
      name: 'valid_email',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập đúng định dạng mật khẩu`
  String get valid_password {
    return Intl.message(
      'Vui lòng nhập đúng định dạng mật khẩu',
      name: 'valid_password',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu`
  String get password {
    return Intl.message(
      'Mật khẩu',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Quên mật khẩu?`
  String get forgot_pass {
    return Intl.message(
      'Quên mật khẩu?',
      name: 'forgot_pass',
      desc: '',
      args: [],
    );
  }

  /// `Chưa có tài khoản? Đăng ký`
  String get dont_have_account {
    return Intl.message(
      'Chưa có tài khoản? Đăng ký',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký`
  String get signup {
    return Intl.message(
      'Đăng ký',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký tài khoản`
  String get create_account {
    return Intl.message(
      'Đăng ký tài khoản',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập tên`
  String get valid_name {
    return Intl.message(
      'Vui lòng nhập tên',
      name: 'valid_name',
      desc: '',
      args: [],
    );
  }

  /// `Tên tài khoản`
  String get username {
    return Intl.message(
      'Tên tài khoản',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Đã có tài khoản? Đăng nhập`
  String get have_account {
    return Intl.message(
      'Đã có tài khoản? Đăng nhập',
      name: 'have_account',
      desc: '',
      args: [],
    );
  }

  /// `Nhập Email của bạn và chúng tôi sẽ gửi cho bạn link đặt lại mật khẩu`
  String get forgot_pass_des {
    return Intl.message(
      'Nhập Email của bạn và chúng tôi sẽ gửi cho bạn link đặt lại mật khẩu',
      name: 'forgot_pass_des',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập email của bạn`
  String get enter_email {
    return Intl.message(
      'Vui lòng nhập email của bạn',
      name: 'enter_email',
      desc: '',
      args: [],
    );
  }

  /// `Đặt lại mật khẩu`
  String get reset_password {
    return Intl.message(
      'Đặt lại mật khẩu',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Khoá học`
  String get course {
    return Intl.message(
      'Khoá học',
      name: 'course',
      desc: '',
      args: [],
    );
  }

  /// `Cá nhân`
  String get profile {
    return Intl.message(
      'Cá nhân',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Cài đặt`
  String get settings {
    return Intl.message(
      'Cài đặt',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Xin chào,`
  String get hello {
    return Intl.message(
      'Xin chào,',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Tìm khóa học`
  String get search_course {
    return Intl.message(
      'Tìm khóa học',
      name: 'search_course',
      desc: '',
      args: [],
    );
  }

  /// `Khóa học Flutter cải thiện kỹ năng của bạn`
  String get course_des {
    return Intl.message(
      'Khóa học Flutter cải thiện kỹ năng của bạn',
      name: 'course_des',
      desc: '',
      args: [],
    );
  }

  /// `Khóa học của bạn`
  String get your_course {
    return Intl.message(
      'Khóa học của bạn',
      name: 'your_course',
      desc: '',
      args: [],
    );
  }

  /// `Đã lưu`
  String get saved {
    return Intl.message(
      'Đã lưu',
      name: 'saved',
      desc: '',
      args: [],
    );
  }

  /// `Thanh toán`
  String get payment {
    return Intl.message(
      'Thanh toán',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Đăng xuất`
  String get log_out {
    return Intl.message(
      'Đăng xuất',
      name: 'log_out',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin tài khoản`
  String get info_account {
    return Intl.message(
      'Thông tin tài khoản',
      name: 'info_account',
      desc: '',
      args: [],
    );
  }

  /// `Xem ảnh đại diện`
  String get see_profile_picture {
    return Intl.message(
      'Xem ảnh đại diện',
      name: 'see_profile_picture',
      desc: '',
      args: [],
    );
  }

  /// `Thay đổi ảnh đại diện`
  String get change_profile_picture {
    return Intl.message(
      'Thay đổi ảnh đại diện',
      name: 'change_profile_picture',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng cập nhật số điện thoại`
  String get update_phone {
    return Intl.message(
      'Vui lòng cập nhật số điện thoại',
      name: 'update_phone',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại`
  String get phone {
    return Intl.message(
      'Số điện thoại',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Chuyển đổi giao diện`
  String get change_theme {
    return Intl.message(
      'Chuyển đổi giao diện',
      name: 'change_theme',
      desc: '',
      args: [],
    );
  }

  /// `Chuyển đổi ngôn ngữ`
  String get change_language {
    return Intl.message(
      'Chuyển đổi ngôn ngữ',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `Cập nhật tài khoản`
  String get update_info {
    return Intl.message(
      'Cập nhật tài khoản',
      name: 'update_info',
      desc: '',
      args: [],
    );
  }

  /// `Lưu`
  String get save {
    return Intl.message(
      'Lưu',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Chụp ảnh`
  String get from_camera {
    return Intl.message(
      'Chụp ảnh',
      name: 'from_camera',
      desc: '',
      args: [],
    );
  }

  /// `Thư viện ảnh`
  String get from_gallery {
    return Intl.message(
      'Thư viện ảnh',
      name: 'from_gallery',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập số điện thoại`
  String get valid_phone {
    return Intl.message(
      'Vui lòng nhập số điện thoại',
      name: 'valid_phone',
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
