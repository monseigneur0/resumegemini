// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gemini_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeminiModelImpl _$$GeminiModelImplFromJson(Map<String, dynamic> json) =>
    _$GeminiModelImpl(
      questionType: $enumDecode(_$QuestionTypeEnumMap, json['questionType']),
      carrierNotice: json['carrierNotice'] as String,
      question: json['question'] as String,
      myEssay: json['myEssay'] as String,
      acceptedEssay: json['acceptedEssay'] as String?,
      response: json['response'] as String?,
    );

Map<String, dynamic> _$$GeminiModelImplToJson(_$GeminiModelImpl instance) =>
    <String, dynamic>{
      'questionType': _$QuestionTypeEnumMap[instance.questionType]!,
      'carrierNotice': instance.carrierNotice,
      'question': instance.question,
      'myEssay': instance.myEssay,
      'acceptedEssay': instance.acceptedEssay,
      'response': instance.response,
    };

const _$QuestionTypeEnumMap = {
  QuestionType.selfIntroduce: 'selfIntroduce',
  QuestionType.motivation: 'motivation',
  QuestionType.personality: 'personality',
  QuestionType.achieve: 'achieve',
  QuestionType.unknown: 'unknown',
};
