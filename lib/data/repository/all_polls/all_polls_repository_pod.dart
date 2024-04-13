import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poll_creation_app/data/repository/all_polls/all_polls_repository.dart';
import 'package:poll_creation_app/data/repository/all_polls/i_all_polls_repository.dart';
import 'package:poll_creation_app/shared/api_client/dio/dio_client_provider.dart';

final allPollsRepoPod = Provider.autoDispose<IAllPollsRepository>((ref) {
  return AllPollsRepository(dio: ref.watch(dioProvider));
});
