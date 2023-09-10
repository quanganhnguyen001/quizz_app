import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:od/features/question/domain/entities/questions_model.dart';
import 'package:od/features/question/presentation/cubit/question_cubit.dart';
import 'package:od/features/question/presentation/widgets/results_widget.dart';
import 'package:od/gen/assets/assets.gen.dart';
import 'package:od/repositories/question_repo.dart';

import '../../../../common/widgets/buttons/button_components.dart';
import '../../../../common/widgets/buttons/header_buttons_components.dart';
import '../../../../theme/color_palettes.dart';
import '../../../../theme/typhography.dart';
import '../widgets/option_widget.dart';

class QuestionScreen extends StatefulWidget {
  static const String routeName = '/QuestionScreen';
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionCubit, QuestionState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: EdgeInsets.only(left: 16),
              child: HeaderButtonComponents(
                padding: EdgeInsets.only(left: 5),
                icon: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios)),
              ),
            ),
            centerTitle: true,
            title: Text(
              'Flutter',
              style: AppTextStyle.H4(color: ColorPalettes.darkColor),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                  child: PageView.builder(
                onPageChanged: (value) {
                  context.read<QuestionCubit>().changePage(value);
                },
                controller: context.read<QuestionCubit>().controller,
                physics: NeverScrollableScrollPhysics(),
                itemCount: state.questionList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Center(
                        child: Text(
                          '${index + 1} of ${state.questionList.length}',
                          style: AppTextStyle.paragraphLarge(
                              color: ColorPalettes.darkgrayColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          state.questionList[index].question ?? '',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.H4(),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                                width: double.infinity,
                                height: 191,
                                color: ColorPalettes.lightGrayColor,
                                child: Assets.images.idea.image())),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: state.questionList[index].options!
                                .asMap()
                                .entries
                                .map((e) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: OptionWidget(
                                  index: e.key,
                                  text: e.value.toString(),
                                  press: state.selectedAnswerIndex < 0
                                      ? () => context
                                          .read<QuestionCubit>()
                                          .pickAnswer(
                                              value: e.key,
                                              correctOptionIndex: state
                                                      .questionList[index]
                                                      .correctOption ??
                                                  0)
                                      : null,
                                  correctAnswer:
                                      state.questionList[index].correctOption ??
                                          0,
                                  isSelect: state.selectedAnswerIndex == e.key,
                                  selectedAnswerIndex:
                                      state.selectedAnswerIndex,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ButtonComponents(
                    onPressed: () {
                      context.read<QuestionCubit>().nextQuestion(
                          currentIndex: state.currentIndex,
                          listlength: state.questionList.length,
                          context: context);
                    },
                    height: 56,
                    radius: 16,
                    title: state.currentIndex == state.questionList.length - 1
                        ? 'See Results'
                        : 'Next',
                    textStyle: AppTextStyle.buttonMedium(
                        color: ColorPalettes.whiteColor),
                    backgroundColor: ColorPalettes.primaryColor,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
