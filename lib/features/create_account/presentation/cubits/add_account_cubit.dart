import 'dart:async';
import 'package:dashboad/features/create_account/presentation/cubits/add_account_states.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/constants/constants.dart';
import '../../domain/repository/create_repo.dart';
import '../../domain/repository/get_sections_repo.dart';

class AddAccountCubit extends Cubit<AddAccountStates> {
  AddAccountCubit(this.createRepo, this.getSectionsRepo)
      : super(AddAccountInitState());

  static AddAccountCubit get(context) => BlocProvider.of(context);

  final CreateRepo createRepo;
  final GetSectionsRepo getSectionsRepo;

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
  var Password = TextEditingController();

  //doctor
  String? Selected_Section;
  int? Section_id;
  var Day_In_Advance = TextEditingController();
  var Duration = TextEditingController();
  String? Selected_Day;

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

  void Select_SectionId({required int id}) {
    Section_id = id;
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
        password: Password.text,
        user_type: Selected_role_list[SelectedIndex]['name'],
        image: (Image_Bytes != null)
            ? MultipartFile.fromBytes(Image_Bytes!,
                filename: Image!.files.single.name)
            : null);
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
            image: (Image_Bytes != null)
                ? MultipartFile.fromBytes(Image_Bytes!,
                    filename: Image!.files.single.name)
                : null,
            user_type: Selected_role_list[SelectedIndex]['name'])
        .then((value) {
      value.fold((error) {
        emit(Error_Create_Patient(error));
      }, (user) {
        emit(Success_Create_Patient());
      });
    });
  }

  Future<void> Create_Doctor() async {
    final response = await createRepo.Create_Doctor(
      first_name: First_name.text,
      middle_name: Middle_name.text,
      last_name: Last_name.text,
      phone_number: Phone.text,
      description: Description.text,
      password: Password.text,
      image: (Image_Bytes != null)
          ? MultipartFile.fromBytes(Image_Bytes!,
              filename: Image!.files.single.name)
          : null,
      section_id: Section_id.toString(),
      days_in_advance: Day_In_Advance.text,
      session_durtion: Duration.text,
    ).then((value) {
      value.fold((error) {
        emit(Error_Create_Doctor(error));
      }, (DoctorModel) {
        emit(Success_Create_Doctor());
      });
    });
  }

  List<String> SectionNames = [];
  List<Map<String, int>> Sections = [];

  Future<void> getSection() async {
    emit(Loading_Create_Section());
    return await getSectionsRepo.getSections().then((value) {
      value.fold((error) {
        emit(Error_Get_Sections(error));
      }, (sections) {
        emit(Success_Get_Sections());
        for (var ele in sections) {
          SectionNames.add(ele.name);
          Sections.add({ele.name: ele.id});
        }
        emit(getDropDownList_state());
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

  ///Add work days

  Map<String, dynamic> Work_Days = {
    "monday": [],
    "tuesday": [],
    "wednesday": [],
    "thursday": [],
    "friday": [],
    "saturday": [],
    "sunday": [],
  };

  void selectDay({required String value}) {
    Selected_Day = value;
    emit(SelectDay_state());
  }

  List<int>? Image_Bytes;
  FilePickerResult? Image;

  Future addImage() async {
    Image = await FilePicker.platform.pickFiles(
      allowMultiple: false,
    );
    if (Image != null) {
      Image_Bytes = Image!.files.single.bytes;
    }
    emit(Add_Image_state());
  }
}
