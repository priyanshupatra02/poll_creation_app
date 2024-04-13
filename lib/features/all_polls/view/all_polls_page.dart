import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:poll_creation_app/features/all_polls/view/widget/poll_complete_response_widget.dart';
import 'package:poll_creation_app/features/homepage/view/widgets/app_bar_color.dart';
import 'package:poll_creation_app/features/homepage/view/widgets/app_bar_title.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class AllPollsPage extends StatelessWidget {
  const AllPollsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AllPollsView();
  }
}

class AllPollsView extends StatelessWidget {
  const AllPollsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(
          appbarTitle: "All Polls",
        ),
        flexibleSpace: const AppBarColor(),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(20),
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return const PollCompleteResponseWidget();
          },
          separatorBuilder: (context, index) => 20.heightBox,
        ),
      ),
    );
  }
}
