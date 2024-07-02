import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'basic_states.dart';

class BasicCubit extends Cubit<BasicStates> {
  BasicCubit() : super(InitiBasicStates());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedIndex = 1; //in_drawer

  static BasicCubit get(context) => BlocProvider.of(context);
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void changeSelctedTap({required int index}) {
    selectedIndex = index;
    emit(ChangeSelectedTapState());
  }

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }
}
