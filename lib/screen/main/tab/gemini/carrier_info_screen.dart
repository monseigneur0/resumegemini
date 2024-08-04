import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resumequest/common/common.dart';
import 'package:resumequest/common/util/app_keyboard_util.dart';
import 'package:resumequest/common/widget/w_main_button.dart';
import 'package:resumequest/common/widget/w_main_button_disabled.dart';
import 'package:resumequest/common/widget/w_text_input_box.dart';
import 'package:resumequest/screen/main/tab/gemini/gemini_controller.dart';
import 'package:resumequest/screen/main/tab/gemini/personal_story_screen.dart';

class CarrierInfoScreen extends ConsumerStatefulWidget {
  static const routeName = "carrierinfo";
  static const routeUrl = "/carrierinfo";
  const CarrierInfoScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CarrierInfoScreenState();
}

class _CarrierInfoScreenState extends ConsumerState<CarrierInfoScreen> {
  //provider로 담아둬서 계속 상태관리하기. 이전화면으로 돌아올때 다시 보여주기. go router통해서 화면이동하기.
  //web이기 때문에 필요한 부분url통해서 이통할 필요 있음.
  final carrierNoticeController = TextEditingController();
  Logger logger = Logger();

  @override
  void initState() {
    carrierNoticeController.text = ref.read(geminiModelProvider.notifier).state.carrierNotice;
    //dev
    // carrierNoticeController.text = ref.read(geminiModelProvider.notifier).state.carrierNotice.isNotBlank
    //     ? ref.read(geminiModelProvider.notifier).state.carrierNotice
    //     : "IT기획, 담당업무:  SAP 기반 그룹 One-ERP 구축 프로젝트 PMO 역할 수행 프로젝트 계획 진척 및 관리, 프로젝트 의사소통 및 협업 프로젝트 산출물 관리 SAP 테스트환경 관리, 자격요건: 대졸 예정자 및 졸업자 이상 (4년) 경력무관, 보고서 작성, 프리젠테이션, 커뮤니케이션 스킬(인턴)  우대 : 컴퓨터공학 계열, 경영정보 계열 전공자, 디자인TOOL사용 가능자 우대 (포토샵, 일러스트 등)";

    super.initState();
  }

  @override
  void dispose() {
    carrierNoticeController.dispose();
    super.dispose();
  }

  final int _currentStep = 1; // Track the current step

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
    return Scaffold(
      body: SafeArea(
        child: Tap(
          onTap: () => AppKeyboardUtil.hide(context),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                '모집 공고를 적어주세요. *본인 직무만 넣어주세요.'.text.make(),
                TextInputBox(
                  carrierNoticeController,
                  hintText: '마켓팅, 담당업무: 홍보기획 및 실행, 자격요건: 커뮤니케이션 능통자...',
                  onChanged: (p0) {
                    setState(() {});
                  },
                ),
                carrierNoticeController.text.isEmpty
                    ? const MainButtonDisabled('모집 공고를 입력해주세요')
                    : MainButton(
                        '본인 경험 입력하고 생성하기',
                        onPressed: () {
                          final re = ref.read(geminiModelProvider.notifier)
                            ..update((state) => state.copyWith(carrierNotice: carrierNoticeController.text));
                          logger.d(re.state.toString());
                          context.push(PersonalStoryScreen.routeUrl);
                        },
                      ),
              ],
            ).pSymmetric(h: 10, v: 10),
          ),
        ),
      ),
    );
  }
}
