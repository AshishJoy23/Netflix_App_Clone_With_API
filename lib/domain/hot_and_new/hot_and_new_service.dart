

import 'package:dartz/dartz.dart';
import 'package:netflix_app_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_app_clone/domain/hot_and_new/model/hot_and_new_resp.dart';

abstract class HotAndNewService {
  Future<Either<MainFailure,HotAndNewResp>> getHotAndNewMovieData();
  Future<Either<MainFailure,HotAndNewResp>> getHotAndNewTvData();
}