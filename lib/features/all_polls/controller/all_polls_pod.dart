import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poll_creation_app/data/model/all_polls_model.dart';
import 'package:poll_creation_app/data/repository/all_polls/all_polls_repository_pod.dart';

final allPollsPod = FutureProvider.autoDispose<AllPollsModel>((ref) async {
  final result = await ref.watch(allPollsRepoPod).getAllPolls();
  return result.when(
    (allPollsModel) => allPollsModel,
    (error) => throw (error.errorMessage),
  );
});
