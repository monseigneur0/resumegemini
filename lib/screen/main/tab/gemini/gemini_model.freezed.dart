// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gemini_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GeminiModel _$GeminiModelFromJson(Map<String, dynamic> json) {
  return _GeminiModel.fromJson(json);
}

/// @nodoc
mixin _$GeminiModel {
  QuestionType get questionType => throw _privateConstructorUsedError;
  String get carrierNotice => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String get myEssay => throw _privateConstructorUsedError;
  String? get acceptedEssay => throw _privateConstructorUsedError;
  String? get response => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeminiModelCopyWith<GeminiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeminiModelCopyWith<$Res> {
  factory $GeminiModelCopyWith(
          GeminiModel value, $Res Function(GeminiModel) then) =
      _$GeminiModelCopyWithImpl<$Res, GeminiModel>;
  @useResult
  $Res call(
      {QuestionType questionType,
      String carrierNotice,
      String question,
      String myEssay,
      String? acceptedEssay,
      String? response});
}

/// @nodoc
class _$GeminiModelCopyWithImpl<$Res, $Val extends GeminiModel>
    implements $GeminiModelCopyWith<$Res> {
  _$GeminiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionType = null,
    Object? carrierNotice = null,
    Object? question = null,
    Object? myEssay = null,
    Object? acceptedEssay = freezed,
    Object? response = freezed,
  }) {
    return _then(_value.copyWith(
      questionType: null == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as QuestionType,
      carrierNotice: null == carrierNotice
          ? _value.carrierNotice
          : carrierNotice // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      myEssay: null == myEssay
          ? _value.myEssay
          : myEssay // ignore: cast_nullable_to_non_nullable
              as String,
      acceptedEssay: freezed == acceptedEssay
          ? _value.acceptedEssay
          : acceptedEssay // ignore: cast_nullable_to_non_nullable
              as String?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeminiModelImplCopyWith<$Res>
    implements $GeminiModelCopyWith<$Res> {
  factory _$$GeminiModelImplCopyWith(
          _$GeminiModelImpl value, $Res Function(_$GeminiModelImpl) then) =
      __$$GeminiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {QuestionType questionType,
      String carrierNotice,
      String question,
      String myEssay,
      String? acceptedEssay,
      String? response});
}

/// @nodoc
class __$$GeminiModelImplCopyWithImpl<$Res>
    extends _$GeminiModelCopyWithImpl<$Res, _$GeminiModelImpl>
    implements _$$GeminiModelImplCopyWith<$Res> {
  __$$GeminiModelImplCopyWithImpl(
      _$GeminiModelImpl _value, $Res Function(_$GeminiModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionType = null,
    Object? carrierNotice = null,
    Object? question = null,
    Object? myEssay = null,
    Object? acceptedEssay = freezed,
    Object? response = freezed,
  }) {
    return _then(_$GeminiModelImpl(
      questionType: null == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as QuestionType,
      carrierNotice: null == carrierNotice
          ? _value.carrierNotice
          : carrierNotice // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      myEssay: null == myEssay
          ? _value.myEssay
          : myEssay // ignore: cast_nullable_to_non_nullable
              as String,
      acceptedEssay: freezed == acceptedEssay
          ? _value.acceptedEssay
          : acceptedEssay // ignore: cast_nullable_to_non_nullable
              as String?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeminiModelImpl extends _GeminiModel {
  _$GeminiModelImpl(
      {required this.questionType,
      required this.carrierNotice,
      required this.question,
      required this.myEssay,
      this.acceptedEssay,
      this.response})
      : super._();

  factory _$GeminiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeminiModelImplFromJson(json);

  @override
  final QuestionType questionType;
  @override
  final String carrierNotice;
  @override
  final String question;
  @override
  final String myEssay;
  @override
  final String? acceptedEssay;
  @override
  final String? response;

  @override
  String toString() {
    return 'GeminiModel(questionType: $questionType, carrierNotice: $carrierNotice, question: $question, myEssay: $myEssay, acceptedEssay: $acceptedEssay, response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeminiModelImpl &&
            (identical(other.questionType, questionType) ||
                other.questionType == questionType) &&
            (identical(other.carrierNotice, carrierNotice) ||
                other.carrierNotice == carrierNotice) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.myEssay, myEssay) || other.myEssay == myEssay) &&
            (identical(other.acceptedEssay, acceptedEssay) ||
                other.acceptedEssay == acceptedEssay) &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, questionType, carrierNotice,
      question, myEssay, acceptedEssay, response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeminiModelImplCopyWith<_$GeminiModelImpl> get copyWith =>
      __$$GeminiModelImplCopyWithImpl<_$GeminiModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeminiModelImplToJson(
      this,
    );
  }
}

abstract class _GeminiModel extends GeminiModel {
  factory _GeminiModel(
      {required final QuestionType questionType,
      required final String carrierNotice,
      required final String question,
      required final String myEssay,
      final String? acceptedEssay,
      final String? response}) = _$GeminiModelImpl;
  _GeminiModel._() : super._();

  factory _GeminiModel.fromJson(Map<String, dynamic> json) =
      _$GeminiModelImpl.fromJson;

  @override
  QuestionType get questionType;
  @override
  String get carrierNotice;
  @override
  String get question;
  @override
  String get myEssay;
  @override
  String? get acceptedEssay;
  @override
  String? get response;
  @override
  @JsonKey(ignore: true)
  _$$GeminiModelImplCopyWith<_$GeminiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
