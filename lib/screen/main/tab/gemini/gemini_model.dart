import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resumequest/screen/main/tab/gemini/question_type.dart';

part 'gemini_model.freezed.dart';
part 'gemini_model.g.dart'; //json_serializable 의 fromJson 및 toJson 기능

@freezed
class GeminiModel with _$GeminiModel {
  factory GeminiModel({
    required QuestionType questionType,
    required String carrierNotice,
    required String question,
    required String myEssay,
    String? acceptedEssay,
    String? response,
  }) = _GeminiModel;
  GeminiModel._();

  factory GeminiModel.fromJson(Map<String, dynamic> json) => _$GeminiModelFromJson(json);
}
//dart run build_runner build
//enum 을 통한 자소서 종류 확정,, unknown 추가