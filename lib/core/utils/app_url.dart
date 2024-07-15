const baseServ = "http://192.168.1.17:8000/";
const baseUrl = "${baseServ}api/";
const auth = "auth/";
const dashboard = 'dashboard/';
const delete = 'destroy/';

class AppUrl {
  /*>>>>>>>>>>>>>>>>>>>> Auth <<<<<<<<<<<<<<<<<<<<*/
  static const requestCode = '$baseUrl${auth}request-code';
  static const verifyCode = '$baseUrl${auth}verify-code';
  /*>>>>>>>>>>>>>>>>>>>> Directors <<<<<<<<<<<<<<<<<<<<*/
  static const getDirectorsList = '$baseUrl${dashboard}director';
  static const deleteDirector = '$baseUrl${dashboard}director/$delete';
  /*>>>>>>>>>>>>>>>>>>>> Doctors <<<<<<<<<<<<<<<<<<<<*/
  static const getDoctorsList = '$baseUrl${dashboard}doctor';
  static const deleteDoctor = '$baseUrl${dashboard}doctor/$delete';
  /*>>>>>>>>>>>>>>>>>>>> Patients <<<<<<<<<<<<<<<<<<<<*/
  static const getPatientsList = '$baseUrl${dashboard}patient';
  static const deletePatient = '$baseUrl${dashboard}patient/$delete';
}
