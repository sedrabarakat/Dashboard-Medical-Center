import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';

abstract class AddAccountStates{}

class AddAccountInitState extends AddAccountStates{}

class Change_Select_State extends AddAccountStates{}

class Select_Sections_State extends AddAccountStates{}

class Select_Gender_State extends AddAccountStates{}

class Select_MatrialStates_State extends AddAccountStates{}

class Select_BloodType_State extends AddAccountStates{}

class Select_Boolean_State extends AddAccountStates{}

class Select_Date_State extends AddAccountStates{}

class Calc_age_State extends AddAccountStates{}

class Loading_Create_User extends AddAccountStates{}
class Success_Create_User extends AddAccountStates{}
class Error_Create_User extends AddAccountStates{
  NetworkExceptions error;
  Error_Create_User(this.error);
}


class Loading_Create_Patient extends AddAccountStates{}
class Success_Create_Patient extends AddAccountStates{}
class Error_Create_Patient extends AddAccountStates{
  NetworkExceptions error;
  Error_Create_Patient(this.error);
}


class Loading_Create_Section extends AddAccountStates{}
class Success_Get_Sections extends AddAccountStates{}
class Error_Get_Sections extends AddAccountStates{
  NetworkExceptions error;
  Error_Get_Sections(this.error);
}

class getDropDownList_state extends AddAccountStates{}

class SelectDay_state extends AddAccountStates{}

class Add_Image_state extends AddAccountStates{}




