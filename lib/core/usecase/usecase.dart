import 'dart:async';

import 'package:blog_app/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class Usecase<Successtype, Params> {
  //a usecase can only return one function
  Future<Either<Failure, Successtype>> call(Params params);
}


// usecase exposes the high level functionality of the task it will perform
