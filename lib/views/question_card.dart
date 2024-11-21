import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/models/questions_model.dart';
import 'package:quiz_app/utils/constants.dart';
import 'package:quiz_app/views/option.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  const QuestionCard({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    QuestionController questionController = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.questions,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: kBlackColor),
          ),
          const SizedBox(
            height: kDefaultPadding / 2,
          ),
          ...List.generate(
            question.options.length,
            (index) => Options(
              text: question.options[index],
              index: index,
              press: () => questionController.checkAns(question, index),
            ),
          ),
        ],
      ),
    );
  }
}
