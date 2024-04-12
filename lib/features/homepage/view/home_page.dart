import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:poll_creation_app/const/app_colors.dart';
import 'package:poll_creation_app/features/homepage/const/home_page_form_keys.dart';
import 'package:poll_creation_app/features/homepage/view/widgets/app_bar_color.dart';
import 'package:poll_creation_app/features/homepage/view/widgets/app_bar_title.dart';
import 'package:poll_creation_app/features/homepage/view/widgets/header_text.dart';
import 'package:poll_creation_app/features/homepage/view/widgets/poll_widget.dart';
import 'package:poll_creation_app/features/homepage/view/widgets/statement_form.dart';
import 'package:poll_creation_app/features/homepage/view/widgets/topic_form.dart';
import 'package:poll_creation_app/shared/widget/primary_action_button.dart';
import 'package:poll_creation_app/shared/widget/small_text_form.dart';
import 'package:velocity_x/velocity_x.dart';

enum Polls { mcq, picture, rate }

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Polls? selectedRadio = Polls.mcq;
  final homeFormKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(),
        flexibleSpace: const AppBarColor(),
      ),
      body: SafeArea(
        child: FormBuilder(
          key: homeFormKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            clipBehavior: Clip.none,
            primary: true,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                35.heightBox,
                'Create Poll'
                    .text
                    .size(20)
                    .color(AppColors.kTertiaryColor)
                    .bold
                    .make()
                    .objectCenter(),
                40.heightBox,
                HeaderText(
                  headerText: 'Topic'.toUpperCase(),
                ),
                15.heightBox,
                const TopicForm(),
                25.heightBox,
                const HeaderText(
                  headerText: 'Statement',
                ),
                15.heightBox,
                const StatementForm(),
                40.heightBox,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: GradientBoxBorder(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.kTertiaryColor.withOpacity(0.0),
                          AppColors.kTertiaryColor.withOpacity(0.1),
                          AppColors.kTertiaryColor,
                        ],
                      ),
                      width: 0.75,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PollWidget(
                            isSelected: selectedRadio == Polls.mcq,
                            value: Polls.mcq,
                            selectedRadio: selectedRadio,
                            headerText: 'MCQ',
                            onChanged: (Polls? value) {
                              setState(() {
                                selectedRadio = value;
                              });
                            },
                          ),
                          PollWidget(
                            isSelected: selectedRadio == Polls.picture,
                            value: Polls.picture,
                            selectedRadio: selectedRadio,
                            headerText: 'Picture',
                            onChanged: (Polls? value) {
                              setState(() {
                                selectedRadio = value;
                              });
                            },
                          ),
                          PollWidget(
                            isSelected: selectedRadio == Polls.rate,
                            value: Polls.rate,
                            selectedRadio: selectedRadio,
                            headerText: 'Rate It',
                            onChanged: (Polls? value) {
                              setState(() {
                                selectedRadio = value;
                              });
                            },
                          ),
                        ],
                      ),
                      35.heightBox,
                      SmallTextForm(
                        hintText: 'Option 1',
                        name: HomepageFormKeys.option1,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            homeFormKey.currentState!.fields[HomepageFormKeys.option1]!
                                .didChange('');
                          },
                          child: const Icon(Icons.clear),
                        ),
                        isDense: false,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      ),
                      25.heightBox,
                      SmallTextForm(
                        hintText: 'Option 2',
                        name: HomepageFormKeys.option2,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            homeFormKey.currentState!.fields[HomepageFormKeys.option2]!
                                .didChange('');
                          },
                          child: const Icon(Icons.clear),
                        ),
                        isDense: false,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      ),
                      25.heightBox,
                      SmallTextForm(
                        hintText: 'Option 3',
                        name: HomepageFormKeys.option3,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            homeFormKey.currentState!.fields[HomepageFormKeys.option3]!
                                .didChange('');
                          },
                          child: const Icon(Icons.clear),
                        ),
                        isDense: false,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      ),
                      25.heightBox,
                      SmallTextForm(
                        hintText: 'Option 4',
                        name: HomepageFormKeys.option4,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            homeFormKey.currentState!.fields[HomepageFormKeys.option4]!
                                .didChange('');
                          },
                          child: const Icon(Icons.clear),
                        ),
                        isDense: false,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      ),
                    ],
                  ),
                ),
                40.heightBox,
                PrimaryActionButton(
                  buttonLabel: 'Submit',
                  onPressed: () {},
                ).objectCenter(),
                35.heightBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
