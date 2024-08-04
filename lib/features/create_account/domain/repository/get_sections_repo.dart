import 'package:dartz/dartz.dart';
import 'package:dashboad/features/create_account/data/models/section_model.dart';
import '../../../../core/domain/error_handler/network_exceptions.dart';

abstract class GetSectionsRepo{

  Future<Either<NetworkExceptions,List<SectionModel>>>  getSections();
}