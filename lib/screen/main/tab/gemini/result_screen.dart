import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resumequest/common/common.dart';
import 'package:resumequest/common/widget/w_main_button.dart';
import 'package:resumequest/common/widget/w_main_button_disabled.dart';
import 'package:resumequest/screen/main/s_main.dart';
import 'package:resumequest/screen/main/tab/gemini/gemini_controller.dart';
import 'package:resumequest/screen/main/tab/gemini/question_type.dart';

class ResultScreen extends ConsumerStatefulWidget {
  static const routeName = 'result';
  static const routeUrl = '/result';
  const ResultScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ResultScreenState();
}

class _ResultScreenState extends ConsumerState<ResultScreen> {
  Logger logger = Logger();
  String response = '';
  bool isLoading = false;
  bool done = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final info = ref.watch(geminiModelProvider);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              '마지막으로 확인해보세요.'.selectableText.xl.make(),
              height10,

              '질문'.selectableText.semiBold.xl.make(),
              info.question.selectableText.make(),
              height10,

              '모집 공고'.selectableText.semiBold.xl.make(),
              info.carrierNotice.selectableText.make(),
              height10,

              '내 경험 및 자소서'.selectableText.semiBold.xl.make(),
              info.myEssay.selectableText.make(),
              height10,

              response.length > 5 ? '생성이 완료되었습니다. '.text.semiBold.xl.make() : '생성하시겠습니까? '.text.semiBold.xl.make(),
              isLoading
                  ? const MainButtonDisabled('생성 중')
                  : response.length > 5
                      ? const MainButtonDisabled('생성 완료')
                      : MainButton(
                          '생성하기 ',
                          onPressed: () {
                            setState(() {
                              isLoading = true;
                            });
                            final responseStream2 = ref.watch(geminiControllerProvider.notifier).getResponceGemini();
                            responseStream2.listen((event) {
                              print(event);
                              setState(() {
                                response += event ?? "";
                                isLoading = false;
                              });
                            }).onDone(() {
                              logger.d('stream done');
                              ref
                                  .read(geminiModelProvider.notifier)
                                  .update((state) => state.copyWith(response: response));
                              setState(() {
                                done = true;
                              });
                            });
                          },
                        ),
              height20,
              '생성된 자소서는 Gemini에게 응답을 얻을 때 1회성으로 사용되고 삭제됩니다. \n필요하다면 따로 저장하시기 바랍니다. '.text.make(),
              isLoading ? response.text.make() : Container(),
              height80,
              // MainButton(
              //   'log',
              //   onPressed: () {
              //     logger.d(response);
              //     ref.read(geminiControllerProvider.notifier).getDBText();
              //     ref.read(geminiControllerProvider.notifier).fetchData();
              //   },
              // ),

              MarkdownBody(selectable: true, data: response),
              height20,
              done
                  ? MainButton(
                      '다시 시작하기',
                      onPressed: () {
                        context.go(MainScreen.routeUrl);
                        ref.read(geminiModelProvider.notifier).update((state) => state.copyWith(
                              questionType: QuestionType.unknown,
                              carrierNotice: '',
                              question: '',
                              myEssay: '',
                              acceptedEssay: '',
                            ));
                      },
                    )
                  : Container(),
            ],
          ).pSymmetric(h: 10),
        ),
      ),
    );
  }
}
  // testresponse.isNotBlank
  //           ? IconButton(
  //               onPressed: () {
  //                 context.showSnackbar("copyed");
  //                 Clipboard.setData(ClipboardData(text: testresponse));
  //               },
  //               icon: const Icon(Icons.copy))
  //           : Container(),
  //       testresponse.isNotBlank
  //           ? Container(
  //               decoration: BoxDecoration(
  //                 border: Border.all(),
  //                 borderRadius: BorderRadius.circular(8),
  //               ),
  //               child: testresponse.selectableText.make().p(5))
  //           : Container(),
  //       isLoading ? const CircularProgressIndicator() : Container(),


