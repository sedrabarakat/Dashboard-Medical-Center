import 'package:dartz/dartz.dart';
import 'package:dashboad/core/data/models/base_model.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/features/create_account/data/models/section_list_model.dart';
import 'package:dashboad/features/create_account/data/models/section_model.dart';
import 'package:dashboad/features/create_account/domain/repository/get_sections_repo.dart';
import '../data_source/remote/get_sections_remote.dart';

class GetSectionsRepoImp extends GetSectionsRepo{
  GetSectionsRemote getSectionsRemote;
  GetSectionsRepoImp(this.getSectionsRemote);

  @override
  Future<Either<NetworkExceptions,List<SectionModel>>> getSections() async{
    try {
      BaseModel response = await getSectionsRemote.getSection();
      List<SectionModel>sections=[];
      response.data.forEach((element){
        sections.add(SectionModel.fromJson(element));
      });
      return Right(sections);
    }
    catch(error){
      print(NetworkExceptions.getException(error));
      return left(NetworkExceptions.getException(error));
    }
  }




}