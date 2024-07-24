import 'package:dashboad/features/create_account/presentation/cubits/add_account_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/constants/constants.dart';
import '../../domain/repository/create_repo.dart';

class AddAccountCubit extends Cubit<AddAccountStates> {
  AddAccountCubit(this.createRepo) : super(AddAccountInitState());

  static AddAccountCubit get(context) => BlocProvider.of(context);

  final CreateRepo createRepo;

  int SelectedIndex = -1;

  String? Selected_Gender;
  String? Selected_Blood_Type;
  String? Status;
  String? Diabetes;
  String? Pressure;

  ///controllers
  var First_name = TextEditingController();
  var Middle_name = TextEditingController();
  var Last_name = TextEditingController();
  var Phone = TextEditingController(text: "+963 ");
  var Description = TextEditingController();

  //doctor
  String? Selected_Section;
  var Day_In_Advance = TextEditingController();
  var Duration = TextEditingController();

  //patient
  var Birth_Date = TextEditingController();
  var Age = TextEditingController();
  var Address = TextEditingController();
  var Blood_Type = TextEditingController();
  var Matrial_Status = TextEditingController();
  var Children_num = TextEditingController();
  var Habit = TextEditingController();
  var profession = TextEditingController();
  var wallet = TextEditingController();

  ///Select Fields method

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

  void Select_Date(String val) {
    Birth_Date.text = val.toString();
    emit(Select_Date_State());
  }

  ///

  /// Creat Users
  Future<void> Create_User() async {
    emit(Loading_Create_User());
    final response = await createRepo.Create_User(
      first_name: First_name.text,
      middle_name: Middle_name.text,
      last_name: Last_name.text,
      phone_number: Phone.text,
      description: Description.text,
      user_type: Selected_role_list[SelectedIndex]['name'],
    );
    response.fold((error) {
      emit(Error_Create_User(error));
    }, (user) {
      emit(Success_Create_User());
    });
  }

  Future<void> Create_Patient() async {
    emit(Loading_Create_Patient());
    return await createRepo.Create_Patient(
            first_name: First_name.text,
            middle_name: Middle_name.text,
            last_name: Last_name.text,
            phone_number: Phone.text.trim(),
            description: Description.text,
            birth_date: Birth_Date.text,
            age: Age.text,
            gender: Selected_Gender.toString(),
            address: Address.text,
            bloodType: Selected_Blood_Type.toString(),
            marital_status: Status.toString(),
            children_num: int.parse(Children_num.text),
            habits: Habit.text,
            profession: profession.text,
            diabetes: (Diabetes == "Haven\'t") ? false : true,
            blood_pressure: (Pressure == "Haven\'t") ? false : true,
            wallet: int.parse(wallet.text),
            user_type: Selected_role_list[SelectedIndex]['name'])
        .then((value) {
      value.fold((error) {
        emit(Error_Create_Patient(error));
      }, (user) {
        print("sososososs");
        emit(Success_Create_Patient());
      });
    });
  }

  ///
  int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }
    Age.text = age.toString();
    emit(Calc_age_State());
    return age;
  }
}
