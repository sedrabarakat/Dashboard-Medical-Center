import 'package:bloc/bloc.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/features/lab_master/data/models/request_model.dart';
import 'package:dashboad/features/lab_master/domain/repositories/lab_repo.dart';
import 'package:dashboad/features/lab_master/presentation/pages/widgets/flip_card_animation.dart';
import 'package:dashboad/features/sections/data/models/section_model.dart';
import 'package:flutter/material.dart';

part 'lab_state.dart';

class LabCubit extends Cubit<LabState> {
  final LabRepo _repo;
  LabCubit(this._repo) : super(LabInitialState());
  List<SectionService> services = [];
  List<RequestModel> requests = [];
  List<FlipCardController> cardControllers = [];
  final TextEditingController searchController = TextEditingController();
  String labStatus = 'All';
  Future<void> getLabRequest() async {
    emit(GetLabRequetLoadingState());
    requests.clear();
    cardControllers.clear();
    await getServices();
    final response = await _repo.getLabRequest(searchController.text,
        labStatus == "All" ? "" : labStatus.toLowerCase());
    response.fold((error) => emit(GetLabRequestErrorState(error)), (data) {
      List<RequestModel> temp =
          data.list.map((request) => request as RequestModel).toList();

      requests = temp;
      cardControllers =
          List.generate(requests.length, (index) => FlipCardController());
      emit(GetLabRequestSuccessState(requests));
    });
  }

  Future<void> makeItDone(int id, String? state) async {
    if (labStatus == 'Done' || labStatus == 'Failed') {
      return;
    }
    if (state == "done" || state == "failed" || state == null) {
      return;
    }
    final response = await _repo.makeItDone(id);
    response.fold((error) {
      emit(MakeItDoneErrorState(error));
    }, (data) {
      handleDoneAndFail(id: id, process: 'Done');
      emit(MakeItDoneSuccessState(data.message));
      emit(GetLabRequestSuccessState(requests));
    });
  }

  Future<void> makeItFail(int id, String? state) async {
    if (labStatus == 'Done' || labStatus == 'Failed') {
      return;
    }
    if (state == "done" || state == "failed" || state == null) {
      return;
    }
    final response = await _repo.makeItFail(id);
    response.fold((error) {
      emit(MakeItFailErrorState(error));
    }, (data) {
      handleDoneAndFail(id: id, process: 'Fail');
      emit(MakeItFailSuccessState(data.message));
      emit(GetLabRequestSuccessState(requests));
    });
  }

  Future<void> getServices() async {
    final response = await _repo.getServices();
    response.fold((error) => emit(GetLabRequestErrorState(error)), (data) {
      List<SectionService> temp =
          data.list.map((service) => service as SectionService).toList();
      services = temp;
    });
  }

  String getServiceNameById(int id) {
    late String serviceName;
    for (int i = 0; i < services.length; i++) {
      if (services[i].id == id) {
        serviceName = services[i].name;
        break;
      }
    }
    return serviceName;
  }

  void updateRequestsList(int id) {
    if (labStatus != 'All') {
      final int index = requests.indexWhere((request) => request.id == id);
      cardControllers.removeAt(index);
      requests.removeAt(index);
    }
  }

  void handleDoneAndFail({required int id, required String process}) {
    final int index = requests.indexWhere((request) => request.id == id);
    RequestModel requestToUpdate = requests.elementAt(index);
    if (labStatus == "All") {
      if (requestToUpdate.labStatus == "done" ||
          requestToUpdate.labStatus == 'failed') {
        return;
      } else {
        requests.removeAt(index);
        requests.insert(
          index,
          RequestModel(
              id: requestToUpdate.id,
              sessionId: requestToUpdate.sessionId,
              serviceId: requestToUpdate.serviceId,
              doctorId: requestToUpdate.doctorId,
              session: requestToUpdate.session,
              createdDate: requestToUpdate.createdDate,
              createdTimeStamp: requestToUpdate.createdTimeStamp,
              description: requestToUpdate.description,
              labStatus: process == "Done" ? 'done' : 'failed'),
        );
      }
    } else if (labStatus == "Pending") {
      requests.removeAt(index);
      cardControllers.removeAt(index);
    } else {
      return;
    }
  }
}
