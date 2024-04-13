import 'package:multiple_result/multiple_result.dart';
import 'package:poll_creation_app/data/model/all_polls_model.dart';
import 'package:poll_creation_app/shared/exception/base_exception.dart';

abstract class IAllPollsRepository {
 Future<Result<AllPollsModel, APIException>> getAllPolls();
}
