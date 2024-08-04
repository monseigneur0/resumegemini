import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resumequest/common/common.dart';
import 'package:resumequest/common/util/app_keyboard_util.dart';
import 'package:resumequest/common/widget/w_main_button.dart';
import 'package:resumequest/common/widget/w_main_button_disabled.dart';
import 'package:resumequest/common/widget/w_text_input_box.dart';
import 'package:resumequest/screen/main/tab/gemini/gemini_controller.dart';
import 'package:resumequest/screen/main/tab/gemini/result_screen.dart';

class AcceptedEssayScreen extends ConsumerStatefulWidget {
  static const routeName = "acceptedessay";
  static const routeUrl = "/acceptedessay";

  const AcceptedEssayScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AcceptedEssayScreenState();
}

class _AcceptedEssayScreenState extends ConsumerState<AcceptedEssayScreen> {
  final acceptedEssayController = TextEditingController();
  Logger logger = Logger();
  String response = '';
  bool isLoading = false;

  @override
  void initState() {
    //추후 firebase에 prompt를 저장해두자.
    acceptedEssayController.text = ref.read(geminiModelProvider.notifier).state.myEssay;

    acceptedEssayController.text = ref.read(geminiModelProvider.notifier).state.myEssay.isNotBlank
        ? ref.read(geminiModelProvider.notifier).state.myEssay
        : "실무경험 10주간 상권 분석 기업의 데이터 팀에서 현장 실습을 하며 느낀 플랫폼 기획의 중요성을 느꼈습니다.20개가 넘는 타사 프롭테크의 주요 페이지의 키워드를 설정 후 앱과 웹을 나누어 표로 정리했습니다. 그 결과, 대부분이 비슷한 데이터를 제공하며 매물 소개, 상권 분석 등 비슷한 기능을 갖고 있지만, 플랫폼 기획력에 따라 사용자의 수가 확연히 차이 난다는 것을 깨달았습니다.전공 수업 중 BIZAGI 모델러를 통해  E-R 다이어그램을 수립하며 부서별 휴가 승인 과정을 시각화하여 문제점을 개선한 TO-BE 모델을 만든 경험을 바탕으로 직관적인 소비자 관점의 플랫폼 기획에 기여하겠습니다. \n데이터분석력 \n기획력과 더불어 프로그래밍 능력을 갖추기 위해 학부 과정에서의 c언어, 파이썬, R, 확률 통계를 전공 수업에서 배운 후 심화 데이터 분석 역량을 갖추기 위해 노력해왔습니다. 6개월간의 데이터 분석 국비 교육을 수강하며 ​빅데이터분석기사, ADsP, SQLD와  Office 자격증인 컴활 1급, excel 자격증을 취득했습니다. \n소통 \n실무역량 강화를 위해 참여한 비즈니스 인사이트 도출을 위한 데이터 분석 프로젝트 과정에서 내 집 마련 방안을 주제로 3개월간 부동산 팀 프로젝트를 진행한 경험이 있습니다.데이터 분석에 있어 필요한 부동산 도메인 지식을 갖추기 위해 체계적인 학습 계획을 세웠고 협업툴인 노션을 사용해 진행 상황과 전처리 과정에서의 이슈 사항 등을 팀원 모두가 확인할 수 있게 조치했습니다. 또한 역량과 성향에 따라 파트를 재분배하고 팀원들의 동기부여 제공 및 원활한 일정 수행을 위해 공모전에 참여했습니다. 효율적인 업무 처리 방식을 통해 기한 내 프로젝트를 완성하며 실제 내 집 마련에 적용할만한 결과물이 도출되었다는 호평을 받았습니다. \n비정형 되어 있는 요소들을 체계적으로 변환하여 업무처리 방식을 효율적 증가로 이어지게 하는 것이 기획자라 생각합니다. 업무의 리스크를 사전에 체크하고 분석하여 업무체계를 구축하는 지원자가 되겠습니다";

    super.initState();
  }

  @override
  void dispose() {
    acceptedEssayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Tap(
          onTap: () => AppKeyboardUtil.hide(context),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                'status bar'.text.make(),
                '비슷하게 쓰고 싶은 \n합격 자소서를 추가해주세요.(선택)'.text.xl2.make(),
                TextInputBox(
                  acceptedEssayController,
                  hintText: '무엇이든 좋아요. ',
                ),
                acceptedEssayController.text.isEmpty
                    ? const MainButtonDisabled('입력 완료 후 생성하기')
                    : isLoading
                        ? const CircularProgressIndicator()
                        : MainButton(
                            '생성하기 ',
                            onPressed: () {
                              // ref.read(geminiModelProvider) = acceptedEssayController.text;
                              final re = ref.read(geminiModelProvider.notifier)
                                ..update((state) => state.copyWith(carrierNotice: acceptedEssayController.text));
                              logger.d(re.state.toString());
                              setState(() {});
                              final responseStream2 = ref.watch(geminiControllerProvider.notifier).getResponceGemini();
                              responseStream2.listen((event) {
                                isLoading = true;
                                print(event);
                                response += event ?? "";
                                setState(() {
                                  isLoading = false;
                                });
                              });
                              // context.go(ResultScreen.routeUrl);
                            },
                          ),
                '\n비슷하게 작성하고 싶은 합격 자소서가 있다면 입력해주세요.\n입력하지 않아도 되는 항목입니다. \n합격 자소서는 저장되지 않습니다. \nGemini에게 응답을 얻을 때 1회성으로 사용되고 삭제됩니다. \n필요하다면 따로 저장하시기 바랍니다. '
                    .text
                    .make(),
                height30,
                response.selectableText.make(),
                height30,
                // const ResultScreen(),
                MainButton(
                  'loggerTest ',
                  onPressed: () {
                    ref.read(geminiControllerProvider.notifier).loggerTest();
                  },
                ),
                height30,
              ],
            ).pSymmetric(h: 10, v: 10),
          ),
        ),
      ),
    );
  }
}
