import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:poll_creation_app/const/app_urls.dart';
import 'package:poll_creation_app/data/model/all_polls_model.dart';
import 'package:poll_creation_app/shared/exception/base_exception.dart';

import 'i_all_polls_repository.dart';

class AllPollsRepository implements IAllPollsRepository {
  final Dio dio;

  AllPollsRepository({required this.dio});
  @override
  Future<Result<AllPollsModel, APIException>> getAllPolls() async {
    final result = await dio.get(AppUrls.pollsUrl);
    if (result.statusCode == 200) {
      return Success(AllPollsModel.fromJson(result.data));
    } else {
      return Error(APIException.fromMap(result.data));
    }
  }
}
