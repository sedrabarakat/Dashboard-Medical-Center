import 'package:dashboad/features/create_account/presentation/cubits/add_account_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAccountCubit extends Cubit<AddAccountStates> {
  AddAccountCubit() : super(AddAccountInitState());

  static AddAccountCubit get(context) => BlocProvider.of(context);

  int SelectedIndex = -1;
  String? Selected_Section;
  String? Selected_Gender;
  String? Selected_Blood_Type;
  String? Status;
  String? Diabetes;
  String? Pressure;

  List<Map<String, dynamic>> Selected_role_list = [
    {
      "name": "Director",
      //endpoint also will be here
    },
    {
      "name": "Doctor",
    },
    {
      "name": "Patient",
    },
    {
      "name": "Reseption",
    },
    {
      "name": "lab-master",
    },
  ];

  List<String> Gender = ["Female", "Male"];

  List<String> Sections = ["Nervous", "Cardiology", "Digestive"];

  List<String> Matrial_Status = ["Single", "Divorced", "Widower"];

  List<String> Boolean_List = ["Have", "Haven\'t"];

  List<String> Blood_Type = [
    "A+",
    "A-",
    "B+",
    "B-",
    "AB+",
    "AB-",
    "O+",
    "O-"
  ];

  void changed_Select({required int index}) {
    SelectedIndex = index;
    emit(Change_Select_State());
  }

  void Select_Section({required String item}) {
    Selected_Section = item;
    emit(Select_Sections_State());
  }

  void Select_Gender({required String value}) {
    Selected_Gender = value;
    emit(Select_Gender_State());
  }

  void Select_Status({required String value}) {
    Status = value;
    emit(Select_MatrialStates_State());
  }

  void Select_Boolean({required String type, required String value}) {
    if (type == "Diabetes")
      Diabetes = value;
    else
      Pressure = value;

    emit(Select_Boolean_State());
  }

  void Select_BloodType({required String value}) {
    Selected_Blood_Type = value;
    emit(Select_BloodType_State());
  }
}
