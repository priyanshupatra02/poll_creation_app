import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:poll_creation_app/const/app_colors.dart';
import 'package:poll_creation_app/features/homepage/view/widgets/app_bar_color.dart';
import 'package:poll_creation_app/features/homepage/view/widgets/app_bar_title.dart';
import 'package:poll_creation_app/features/homepage/view/widgets/header_text.dart';
import 'package:poll_creation_app/features/homepage/view/widgets/poll_widget.dart';
import 'package:poll_creation_app/features/homepage/view/widgets/statement_form.dart';
import 'package:poll_creation_app/features/homepage/view/widgets/topic_form.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(),
        flexibleSpace: const AppBarColor(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              35.heightBox,
              const HeaderText(
                headerText: 'Welcome to the Moderators Poll',
                size: 20,
                color: AppColors.tertiaryColor,
              ).objectCenter(),
              40.heightBox,
              HeaderText(
                headerText: 'Topic'.toUpperCase(),
              ),
              15.heightBox,
              const TopicForm(),
              25.heightBox,
              HeaderText(
                headerText: 'Statement'.toUpperCase(),
              ),
              15.heightBox,
              const StatementForm(),
              25.heightBox,
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
            ],
          ),
        ),
      ),
    );
  }
}
