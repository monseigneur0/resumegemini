import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resumequest/common/common.dart';
import 'package:resumequest/common/util/app_keyboard_util.dart';
import 'package:resumequest/common/widget/w_main_button.dart';
import 'package:resumequest/common/widget/w_main_button_disabled.dart';
import 'package:resumequest/common/widget/w_round_button.dart';
import 'package:resumequest/common/widget/w_text_input_box.dart';
import 'package:resumequest/screen/main/tab/gemini/carrier_info_screen.dart';
import 'package:resumequest/screen/main/tab/gemini/gemini_controller.dart';
import 'package:resumequest/screen/main/tab/gemini/question_type.dart';

class QuestionScreen extends ConsumerStatefulWidget {
  const QuestionScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends ConsumerState<QuestionScreen> {
  final questionController = TextEditingController();
  Logger logger = Logger();
  String testresponse = '';
  late Stream<String?> streamResponse;
  List<String> listresponse = [];
  bool isLoading = false;
  bool buttonSelected = false;
  final List<bool> _isSelected = [false, false, false, false, false];

  void resetList() {
    for (var i = 0; i < _isSelected.length; i++) {
      _isSelected[i] = false;
    }
  }

  @override
  void initState() {
    //추후 firebase에 prompt를 저장해두자.
    questionController.text = ref.read(geminiModelProvider.notifier).state.question;
    // dev
    // questionController.text = ref.read(geminiModelProvider.notifier).state.question.isNotBlank
    //     ? ref.read(geminiModelProvider.notifier).state.question
    //     : "직무 수행 시 남들과 차별화 된 강점을 키워드로 선정하여 구체적으로 작성해주세요.(ex. #기획력 #협동 #소통의 왕)*";

    super.initState();
  }

  @override
  void dispose() {
    questionController.dispose();
    super.dispose();
  }

  final int _currentStep = 0; // Track the current step

  Widget _buildStep(int stepNumber) {
    return Container(
      height: 10,
      width: 60,
      decoration: BoxDecoration(
        color: _currentStep >= stepNumber - 1 ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final re = ref.read(geminiModelProvider.notifier);
    return Tap(
      onTap: () => AppKeyboardUtil.hide(context),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildStep(1),
              _buildStep(2),
              _buildStep(3),
            ],
          ),
          height5,
          '자소서 질문 유형을 선택해주세요.'.text.xl2.make(),
          height10,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundButton(
                isEnabled: _isSelected[1],
                text: '자기소개',
                onTap: () {
                  re.update((state) => state.copyWith(questionType: QuestionType.unknown));

                  setState(() {
                    _isSelected[1] = false;
                    buttonSelected = false;
                  });
                },
                onTapDisabled: () {
                  resetList();
                  re.update((state) => state.copyWith(questionType: QuestionType.selfIntroduce));
                  setState(() {
                    _isSelected[1] = true;
                    buttonSelected = true;
                  });
                },
              ),
              width10,
              RoundButton(
                isEnabled: _isSelected[2],
                text: '지원동기',
                onTap: () {
                  re.update((state) => state.copyWith(questionType: QuestionType.unknown));
                  setState(() {
                    _isSelected[2] = false;
                    buttonSelected = false;
                  });
                },
                onTapDisabled: () {
                  resetList();
                  re.update((state) => state.copyWith(questionType: QuestionType.motivation));
                  setState(() {
                    _isSelected[2] = true;
                    buttonSelected = true;
                  });
                },
              ),
            ],
          ),
          height10,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundButton(
                isEnabled: _isSelected[3],
                text: '성격 장단점 및 개선 노력',
                onTap: () {
                  re.update((state) => state.copyWith(questionType: QuestionType.unknown));
                  setState(() {
                    _isSelected[3] = false;
                    buttonSelected = false;
                  });
                },
                onTapDisabled: () {
                  re.update((state) => state.copyWith(questionType: QuestionType.personality));
                  resetList();
                  setState(() {
                    _isSelected[3] = true;
                    buttonSelected = true;
                  });
                },
              ),
              width10,
              RoundButton(
                isEnabled: _isSelected[4],
                text: '성과 및 경험',
                onTap: () {
                  re.update((state) => state.copyWith(questionType: QuestionType.unknown));
                  setState(() {
                    _isSelected[4] = false;
                    buttonSelected = false;
                  });
                },
                onTapDisabled: () {
                  re.update((state) => state.copyWith(questionType: QuestionType.achieve));
                  resetList();
                  setState(() {
                    _isSelected[4] = true;
                    buttonSelected = true;
                  });
                },
              ),
            ],
          ),
          height40,
          height20,

          '자소서 질문을 입력해주세요.'.text.xl2.make(),
          height5,
          TextInputBox(
            questionController,
            hintText: '지원동기를 작성해주세요. 100자 이내',
            onTapDelete: () {
              setState(() {});
            },
            onChanged: (p0) {
              setState(() {});
            },
          ),
          height10,
          questionController.text.isNotEmpty && buttonSelected
              ? MainButton(
                  '모집 공고 입력하고 생성하기',
                  onPressed: () {
                    //글자수가 적으면 충분히 더 적어달라고 요청하기.

                    re.update((state) => state.copyWith(question: questionController.text));
                    // re.state = re.state.copyWith(question: questionController.text); //지양
                    logger.d(re.state.toString());
                    context.push(CarrierInfoScreen.routeUrl);
                  },
                )
              : const MainButtonDisabled('입력하고 생성하기'), // empty or not selected

          // MainButton(
          //   'Future테스트',
          //   onPressed: () {
          //     setState(() {
          //       isLoading = true;
          //     });
          //     final response = ref.read(geminiControllerProvider.notifier).geminiTest();
          //     response.then((value) {
          //       setState(() {
          //         isLoading = false;
          //         testresponse = value ?? "fail";
          //       });
          //     });
          //   },
          // ),
          // MainButton(
          //   'Stream테스트',
          //   onPressed: () {
          //     setState(() {
          //       isLoading = true;
          //     });
          //     streamResponse = ref.read(geminiControllerProvider.notifier).geminiStreamText();
          //     streamResponse.listen((event) {
          //       testresponse += event ?? " ";
          //       logger.d(event);
          //       setState(() {});
          //     });
          //     setState(() {
          //       isLoading = false;
          //     });
          //   },
          // ),
        ],
      ).pSymmetric(h: 10, v: 10),
    );
  }
}
