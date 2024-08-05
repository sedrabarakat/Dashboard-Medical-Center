import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/data/datasources/local.dart';
import 'basic_states.dart';

class BasicCubit extends Cubit<BasicStates> {
  BasicCubit() : super(InitiBasicStates());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedIndex = 0; //in_drawer
  bool isAppointmentsExpanded = false;
  String? selectedAppointmentAction;

  static BasicCubit get(context) => BlocProvider.of(context);
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;


  void changeSelctedTap({required int index}) {
    selectedIndex = index;
    emit(ChangeSelectedTapState());
  }
  void toggleAppointmentsExpanded() {
    isAppointmentsExpanded = !isAppointmentsExpanded;
    emit(ChangeSelectedTapState());
  }

  void selectAppointmentAction(String? action) {
    selectedAppointmentAction = action;
    emit(ChangeSelectedTapState());
  }

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  Future<String?> getRole() async {
    return await SharedPrefrence.getData(key: 'role');
  }
}
