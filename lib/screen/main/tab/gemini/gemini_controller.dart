import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resumequest/common/common.dart';
import 'package:resumequest/prompt.dart';
import 'package:resumequest/screen/main/tab/gemini/gemini_model.dart';
import 'package:resumequest/screen/main/tab/gemini/gemini_repository.dart';
import 'package:resumequest/screen/main/tab/gemini/question_type.dart';

final geminiModelProvider = StateProvider<GeminiModel>((ref) => GeminiModel(
      questionType: QuestionType.unknown,
      carrierNotice: '',
      question: '',
      myEssay: '',
      acceptedEssay: '',
    ));

final geminiControllerProvider = AsyncNotifierProvider<GeminiController, void>(() => GeminiController());

class GeminiController extends AsyncNotifier<void> {
  late final GeminiRepository _repository;
  // late final GenerativeModel model;

  Logger logger = Logger();

  @override
  FutureOr<void> build() {
    _repository = ref.read(geminiRepositoryProvider);
    // initializeModel();
  }

  // void initializeModel() {
  //   model = FirebaseVertexAI.instance.generativeModel(
  //     model: 'gemini-1.5-flash',
  //     generationConfig: generationConfig,
  //   );
  // }

  // final generationConfig = GenerationConfig(
  //   maxOutputTokens: 1000,
  //   stopSequences: ["red"],
  //   temperature: 0.9,
  //   topP: 0.1,
  //   topK: 16,
  // );

  final model = FirebaseVertexAI.instance.generativeModel(
      // model: 'gemini-1.5-flash',
      model: 'gemini-1.5-pro',
      // generationConfig: generationConfig,
      systemInstruction: Content('system', [TextPart('자기소개서 문항에 답변만 해줘.  한글 600자 정도로 생성해줘.')]));

  // Provide a prompt that contains text
  //성과 및 경험 기준으로 생성
  static const systemPrompt =
      '''너는 자기소개서 작성 컨설턴트야. 대기업 입사를 위한 자기소개서를 작성할거야. 자기소개서 질문에 적합한 응답을 해야해. 모집공고에 적합한 내용을 포함할 수 있으면 포함해. 지원자의 정보를 토대로 회사와 직무에 기여할 수 있는 바를 적어줘. 왜 회사가 지원자를 선택해야하는지 이유를 적어줘. 상황에 따른 역할을 설명하고 취한 액션에 따른 이유와 결과를 적어줘. 이 부분이 왜 회사에 도움이 되는지 적어줘. 인터뷰를 하기 위한 자기소개서라는 것을 잊지마.

      <OBJECTIVE_AND_PERSONA>
      You are a personal statement consultant. Your task is to write a personal statement for a large company application. The statement should respond appropriately to the application questions. Include content relevant to the job posting if possible. Based on the applicant's information, describe how they can contribute to the company and the role. Explain why the company should choose the applicant. Describe the roles taken in various situations, the actions taken, and the reasons and results of those actions. Explain how this will benefit the company. Remember, this is a personal statement for an interview.
      </OBJECTIVE_AND_PERSONA>

      <INSTRUCTIONS>
      To complete the task, you need to follow these steps:
      1. Identify the key points from the job posting and the applicant's background.
      2. Describe the applicant's relevant experiences and skills.
      3. Explain how these experiences and skills make the applicant a good fit for the company and the role.
      4. Highlight specific situations where the applicant has demonstrated key skills and the outcomes of their actions.
      5. Relate these experiences to how they can benefit the company.
      6. Conclude by summarizing why the applicant is a strong candidate and emphasizing their enthusiasm for the role.
      </INSTRUCTIONS>

      <CONSTRAINTS>
      Dos:
      1. Use clear and professional Korean language.
      2. Include specific examples and outcomes.
      3. Tailor the statement to the company's values and the job description.

      Don'ts:
      1. Avoid vague statements.
      2. Do not use jargon or overly complex terms.
      3. Avoid generic responses that could apply to any applicant.
      </CONSTRAINTS>

      <CONTEXT>
      The provided context: The applicant is applying for a position at a large company. They have experience in project management and team leadership, and are looking to leverage these skills in a new role.
      </CONTEXT>

      <OUTPUT_FORMAT>
      Provide a structured personal statement with an introduction, body paragraphs covering key experiences and skills, and a conclusion.
      </OUTPUT_FORMAT>

      <FEW_SHOT_EXAMPLES>
      Here we provide some examples:
      1. Example #1
      Input: Describe a time when you led a team to achieve a significant goal.
      Thoughts: Consider the context of the project, the team dynamics, the challenges faced, the actions taken to overcome those challenges, and the final outcome.
      Output: In my previous role as a project manager at XYZ Company, I led a cross-functional team to deliver a new product line within a tight deadline. By implementing agile methodologies and fostering open communication, we were able to complete the project ahead of schedule and under budget. This experience honed my leadership skills and demonstrated my ability to drive results under pressure, making me a strong fit for the project management role at your company.

      2. Example #2
      Input: Explain how your background makes you a suitable candidate for this role.
      Thoughts: Highlight relevant experiences, skills, and how they align with the job description. Consider the company's values and how the applicant's background supports them.
      Output: With a background in software engineering and a proven track record in leading development teams, I bring both technical expertise and leadership experience to this role. At ABC Corp, I managed a team of developers to create a scalable application that increased user engagement by 30%. My ability to bridge the gap between technical teams and business stakeholders aligns with your company's goal of fostering innovation through collaboration.
      </FEW_SHOT_EXAMPLES>

      <RECAP>
      Re-emphasize the key aspects of the prompt, especially the constraints, output format, and clear language requirements. Ensure the personal statement is tailored to the specific job and company, highlighting the applicant's unique qualifications and enthusiasm for the role.
      </RECAP>

      <ADDITIONAL_USER_PROVIDED_INFO>
      Job Posting:
      [Insert Job Posting Details Here]

      Personal Statement Questions:
      [Insert Personal Statement Questions Here]

      Previous Personal Statement:
      [Insert Previous Personal Statement Here]
      </ADDITIONAL_USER_PROVIDED_INFO>
      ''';

  final prompt = [Content.text(systemPrompt)];

  void loggerTest() {
    // logger.d(prompt[0].parts[0]);
    logger.d(prompt[0].toJson());
  }

  Future<String?> geminiTest() async {
    // To generate text output, call generateContent with the text input
    final response = await model.generateContent(prompt);
    logger.d(response.text);
    return response.text;
  }

  Stream<String?> geminiStreamText() async* {
    // To generate text output, call generateContent with the text input
    final response = model.generateContentStream(prompt);
    await for (final chunk in response) {
      yield chunk.text;
    }
  }

  Future<String?> sendGemini() async {
    // Provide a prompt that contains text
    final essay = ref.read(geminiModelProvider.notifier).state;
    final promptEssay = [Content.text('모집 공고: ${essay.carrierNotice}, 질문: ${essay.question}, 자기소개서: ${essay.myEssay}')];
    final List<Content> finalPrompt = [...prompt, ...promptEssay];
    // To generate text output, call generateContent with the text input
    final response = await model.generateContent(finalPrompt);
    logger.d(response.text);

    return response.text;
  }

  Stream<String?> getResponceGemini() async* {
    final essay = ref.read(geminiModelProvider.notifier).state;

    String promptSelected = switch (essay.questionType) {
      QuestionType.selfIntroduce => Prompt.selfIntroduce,
      QuestionType.motivation => Prompt.motivation,
      QuestionType.personality => Prompt.personality,
      QuestionType.achieve => Prompt.achieve,
      QuestionType.unknown => Prompt.unknown,
    };

    // final dbprompt = await _repository.getPrompt(essay.questionType.name);
    // logger.d(dbprompt['prompt']);
    logger.d(promptSelected);
    final promptEssay = [
      Content.text('$promptSelected 모집 공고: ${essay.carrierNotice}, 질문: ${essay.question}, 자기소개서: ${essay.myEssay}')
    ];
    // final List<Content> finalPrompt = [...prompt, ...promptEssay];
    // final tokenCount2 = await model.countTokens(promptEssay);
    // logger.d('Token count: ${tokenCount.totalTokens}, billable characters: ${tokenCount.totalBillableCharacters}');
    final response = model.generateContentStream(promptEssay);
    //ServerException (Please ensure that multiturn requests alternate between user and model.)
    await for (final chunk in response) {
      yield chunk.text;
    }
  }

  Future<void> getDBText() async {
    final dbprompt = await _repository.getPrompt('achieve');
    return;
  }

  Future<void> fetchData() async {
    int retryCount = 0;
    const maxRetries = 3;
    const initialDelay = 1000; // 1 second

    while (retryCount < maxRetries) {
      try {
        // Your Firestore code (e.g., getting a document)
        final snapshot = await FirebaseFirestore.instance.collection('your_collection').doc('your_document_id').get();
        // ... process the data
        break; // Exit the loop if successful
      } on FirebaseException catch (e) {
        if (e.code == 'unavailable' && retryCount < maxRetries) {
          retryCount++;
          int delay = initialDelay * retryCount * retryCount; // Exponential backoff
          print('Firestore unavailable. Retrying in ${delay / 1000} seconds...');
          await Future.delayed(Duration(milliseconds: delay));
        } else {
          // Handle other FirebaseExceptions
          print('Firebase error: ${e.code}');
          rethrow; // Re-throw the exception to be handled elsewhere
        }
      }
    }
  }
}
