import 'package:dartz/dartz.dart';

import '../../../../core/data/models/base_model.dart';
import '../../../../core/domain/error_handler/network_exceptions.dart';

abstract class CreateRepo{

  Future<Either<NetworkExceptions, BaseModel>>Create_Director();


}