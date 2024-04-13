import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:poll_creation_app/const/app_colors.dart';
import 'package:poll_creation_app/features/all_polls/view/widget/one_poll_response_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class PollCompleteResponseWidget extends StatelessWidget {
  final String topic;
  final String statement;
  final int numberOfPolls;
  final List<String> pollTitles;
  final int pollResponsePercent;
  final int noOfLikes;
  final int noOfComments;
  const PollCompleteResponseWidget({
    super.key,
    required this.topic,
    required this.statement,
    required this.numberOfPolls,
    required this.pollTitles,
    required this.pollResponsePercent,
    required this.noOfLikes,
    required this.noOfComments,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: GradientBoxBorder(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.kPrimaryColor.withOpacity(0.04),
                  AppColors.kPrimaryColor,
                ],
              ),
              width: 1.5,
            ),
          ),
          child: Column(
            children: [
              topic.text
                  .fontFamily(GoogleFonts.odorMeanChey().fontFamily!)
                  .size(22)
                  .align(TextAlign.center)
                  .color(AppColors.kTertiaryColor)
                  .make(),
              20.heightBox,
              statement.text.size(18).color(AppColors.kHeaderTextColor.withOpacity(0.6)).make(),
              10.heightBox,
              RichText(
                text: const TextSpan(
                  text: 'Follow ',
                  style: TextStyle(
                    color: AppColors.kPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: '@ TOI | Today',
                      style: TextStyle(
                        color: AppColors.kTertiaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              20.heightBox,
              ListView.separated(
                primary: false,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: numberOfPolls,
                itemBuilder: (context, index) {
                  return SinglePollResponseWidget(
                    pollTitle: pollTitles[index],
                    pollPercent: pollResponsePercent,
                  );
                },
                separatorBuilder: (context, index) => 20.heightBox,
              ),
              20.heightBox,
              Row(
                children: [
                  const Icon(Icons.comment_outlined, color: AppColors.kPrimaryColor),
                  5.widthBox,
                  '$noOfComments comments'.text.size(16).color(AppColors.kPrimaryColor).make(),
                  30.widthBox,
                  const Icon(Icons.send, color: AppColors.kPrimaryColor),
                  5.widthBox,
                  'Share'.text.size(16).color(AppColors.kPrimaryColor).make(),
                ],
              ),
              20.heightBox,
              Divider(
                color: AppColors.kPrimaryColor.withOpacity(0.5),
                thickness: 0.5,
              ),
              20.heightBox,
              ListTile(
                isThreeLine: true,
                leading: const CircleAvatar(
                  radius: 25,
                  // backgroundImage: const AssetImage('assets/images/rohit.jpg').image,
                  backgroundColor: AppColors.kTertiaryColor,
                  child: Icon(Icons.person, size: 30, color: AppColors.kSecondaryColor),
                ),
                title: 'Times Of India (TOI)'
                    .text
                    .size(16)
                    .bold
                    .color(AppColors.kTertiaryColor)
                    .make(),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    statement.text
                        .size(14)
                        .color(AppColors.kHeaderTextColor.withOpacity(0.6))
                        .make(),
                    2.heightBox,
                    Row(
                      children: [
                        const Icon(Icons.favorite_border),
                        5.widthBox,
                        noOfLikes.text.size(14).make(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
