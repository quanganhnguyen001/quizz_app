// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'questions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) {
  return _QuestionModel.fromJson(json);
}

/// @nodoc
mixin _$QuestionModel {
  String? get question => throw _privateConstructorUsedError;
  List<String>? get options => throw _privateConstructorUsedError;
  @JsonKey(name: 'correct_option')
  int? get correctOption => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionModelCopyWith<QuestionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionModelCopyWith<$Res> {
  factory $QuestionModelCopyWith(
          QuestionModel value, $Res Function(QuestionModel) then) =
      _$QuestionModelCopyWithImpl<$Res, QuestionModel>;
  @useResult
  $Res call(
      {String? question,
      List<String>? options,
      @JsonKey(name: 'correct_option') int? correctOption});
}

/// @nodoc
class _$QuestionModelCopyWithImpl<$Res, $Val extends QuestionModel>
    implements $QuestionModelCopyWith<$Res> {
  _$QuestionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = freezed,
    Object? options = freezed,
    Object? correctOption = freezed,
  }) {
    return _then(_value.copyWith(
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      correctOption: freezed == correctOption
          ? _value.correctOption
          : correctOption // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionModelCopyWith<$Res>
    implements $QuestionModelCopyWith<$Res> {
  factory _$$_QuestionModelCopyWith(
          _$_QuestionModel value, $Res Function(_$_QuestionModel) then) =
      __$$_QuestionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? question,
      List<String>? options,
      @JsonKey(name: 'correct_option') int? correctOption});
}

/// @nodoc
class __$$_QuestionModelCopyWithImpl<$Res>
    extends _$QuestionModelCopyWithImpl<$Res, _$_QuestionModel>
    implements _$$_QuestionModelCopyWith<$Res> {
  __$$_QuestionModelCopyWithImpl(
      _$_QuestionModel _value, $Res Function(_$_QuestionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = freezed,
    Object? options = freezed,
    Object? correctOption = freezed,
  }) {
    return _then(_$_QuestionModel(
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      options: freezed == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      correctOption: freezed == correctOption
          ? _value.correctOption
          : correctOption // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestionModel implements _QuestionModel {
  const _$_QuestionModel(
      {this.question,
      final List<String>? options,
      @JsonKey(name: 'correct_option') this.correctOption})
      : _options = options;

  factory _$_QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionModelFromJson(json);

  @override
  final String? question;
  final List<String>? _options;
  @override
  List<String>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'correct_option')
  final int? correctOption;

  @override
  String toString() {
    return 'QuestionModel(question: $question, options: $options, correctOption: $correctOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionModel &&
            (identical(other.question, question) ||
                other.question == question) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.correctOption, correctOption) ||
                other.correctOption == correctOption));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, question,
      const DeepCollectionEquality().hash(_options), correctOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionModelCopyWith<_$_QuestionModel> get copyWith =>
      __$$_QuestionModelCopyWithImpl<_$_QuestionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionModelToJson(
      this,
    );
  }
}

abstract class _QuestionModel implements QuestionModel {
  const factory _QuestionModel(
          {final String? question,
          final List<String>? options,
          @JsonKey(name: 'correct_option') final int? correctOption}) =
      _$_QuestionModel;

  factory _QuestionModel.fromJson(Map<String, dynamic> json) =
      _$_QuestionModel.fromJson;

  @override
  String? get question;
  @override
  List<String>? get options;
  @override
  @JsonKey(name: 'correct_option')
  int? get correctOption;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionModelCopyWith<_$_QuestionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
