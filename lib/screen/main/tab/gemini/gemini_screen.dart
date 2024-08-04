import 'package:flutter/material.dart';
import 'package:resumequest/common/common.dart';
import 'package:resumequest/common/util/app_keyboard_util.dart';
import 'package:resumequest/screen/main/tab/gemini/question_screen.dart';

class GeminiFragment extends StatelessWidget {
  static const routeName = "gemini";
  static const routeUrl = "/gemini";
  const GeminiFragment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          color: AppColors.grey50,
          child: Column(
            children: [
              Expanded(
                child: Tap(
                  onTap: () => AppKeyboardUtil.hide(context),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: context.deviceWidth,
                          color: AppColors.primaryJ,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/image/icon/Icon-512.png',
                                width: 40,
                              ),
                              '서합부터'.selectableText.xl2.color(AppColors.grey50).make().p(10),
                            ],
                          ).pSymmetric(h: 10),
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              height120,
                              height40,
                              height40,
                              'AI로 어설픈 자기소개서만'.selectableText.bold.xl3.make(),
                              '만들고 계신가요?'.selectableText.bold.xl3.make(),
                              height80,
                              height40,
                              SizedBox(
                                width: 500,
                                child: ExpansionTile(
                                  // backgroundColor: AppColors.primaryJ,
                                  title: '왜 그럴까요?'.selectableText.semiBold.xl2.make(),
                                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    '1. AI 사용법을 익혀야합니다. \n  잘 사용할 줄 알아야해요.'.selectableText.xl.make(),
                                    height20,
                                    '2. 자소서를 처음 작성한다면 \n  좋은 자소서를 보는 눈이 없습니다.'.selectableText.xl.make(),
                                  ],
                                ).pSymmetric(h: 30),
                              ),
                              height120,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  '하지만 해결방법을 알아도 '.selectableText.medium.xl.make(),
                                  '적용하기는 어렵습니다.'.selectableText.semiBold.xl.make(),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  'AI에 대해 모르더라도 '.selectableText.medium.xl.make(),
                                  '쓸 수 있게 '.selectableText.semiBold.xl.make(),
                                  '만들었습니다.'.selectableText.medium.xl.make(),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  '짧은 시간에 '.selectableText.medium.xl.make(),
                                  '고품질의 자기소개서'.selectableText.semiBold.xl.make(),
                                  '를 만들어보세요.'.selectableText.medium.xl.make(),
                                ],
                              ),
                              height120,
                              '이런 분들에게 좋아요'.selectableText.semiBold.xl2.make(),
                              height10,
                              '자기소개서를 처음 쓰는 대학생'.selectableText.medium.xl.make(),
                              '취업준비생'.selectableText.medium.xl.make(),
                              '이직을 준비 중인 직장인'.selectableText.medium.xl.make(),
                              height120,
                              '자소서, 이렇게 만들어드려요.'.selectableText.semiBold.xl2.make(),
                              height10,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  'Gemini'.selectableText.semiBold.xl.make(),
                                  '를 사용해서 생성해요.'.selectableText.medium.xl.make(),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  '합격자소서'.selectableText.semiBold.xl.make(),
                                  '를 기반으로 한 예시로 생성해요.'.selectableText.medium.xl.make(),
                                ],
                              ),
                              '자기소개서를 구조화시킬 수 있도록 '.selectableText.medium.xl.make(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  'S.T.A.R 기법'.selectableText.semiBold.xl.make(),
                                  '을 사용해요.'.selectableText.medium.xl.make(),
                                ],
                              ),
                              height20,
                              SizedBox(
                                width: 500,
                                child: ExpansionTile(
                                  // backgroundColor: AppColors.primaryJ,
                                  title: 'S.T.A.R 기법이 뭔가요?'.selectableText.medium.xl.make(),
                                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ' Situation, Task, Action, Result 기법입니다.'.selectableText.xl.make(),
                                    height5,
                                    Row(
                                      children: [
                                        ' 상황-과제-행동-결과를 중심으로 '.selectableText.xl.make(),
                                        '자신의 경험'.selectableText.semiBold.xl.make(),
                                        '을 구체적인 '.selectableText.xl.make(),
                                      ],
                                    ),
                                    '이야기처럼 풀어내는 자기소개서 작성 기법입니다. '.selectableText.xl.make(),
                                    height5,
                                    ' 이를 통해, 단순 나열보다 훨씬 설득력 있게 자신의 강점을'.selectableText.xl.make(),
                                    Row(
                                      children: [
                                        '강점을 드러내고 면접관의 '.selectableText.xl.make(),
                                        '기억에 남는 인상'.selectableText.semiBold.xl.make(),
                                        '을 심어줄 '.selectableText.xl.make(),
                                      ],
                                    ),
                                    '수 있습니다.'.selectableText.xl.make(),
                                  ],
                                ).pSymmetric(h: 30),
                              ),
                              height80,
                              const QuestionScreen(),
                              height80,
                              'Powered by Gemini'.text.semiBold.xl.make(),
                              height10,
                            ]).pSymmetric(h: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
