import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poll_creation_app/features/all_polls/controller/all_polls_pod.dart';
import 'package:poll_creation_app/features/all_polls/view/widget/poll_complete_response_widget.dart';
import 'package:poll_creation_app/features/homepage/view/widgets/app_bar_color.dart';
import 'package:poll_creation_app/features/homepage/view/widgets/app_bar_title.dart';
import 'package:poll_creation_app/shared/riverpod_ext/asynvalue_easy_when.dart';
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
        child: Consumer(
          builder: (context, ref, child) {
            final allPollsAsync = ref.watch(allPollsPod);
            return allPollsAsync.easyWhen(
              data: (allPollsResponse) {
                return ListView.separated(
                  padding: const EdgeInsets.all(20),
                  physics: const BouncingScrollPhysics(),
                  itemCount: allPollsResponse.data.length,
                  itemBuilder: (context, index) {
                    final itemDataIndex = allPollsResponse.data[index];
                    return PollCompleteResponseWidget(
                      topic: itemDataIndex.topic,
                      statement: itemDataIndex.statement,
                      numberOfPolls: itemDataIndex.textOptions.length,
                      pollTitles: itemDataIndex.textOptions,
                      pollResponsePercent:
                          (itemDataIndex.response.length / itemDataIndex.response.length +
                                  itemDataIndex.noOfLikes)
                              .toInt(),
                      noOfLikes: itemDataIndex.noOfLikes,
                      noOfComments: itemDataIndex.comments.length,
                    );
                  },
                  separatorBuilder: (context, index) => 20.heightBox,
                );
              },
              loadingWidget: () => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (error, retry) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(error.toString()),
                    ElevatedButton(
                      onPressed: () async {
                        ref.invalidate(allPollsPod);
                      },
                      child: const Text("Retry"),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
