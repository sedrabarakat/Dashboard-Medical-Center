const baseServ = "http://192.168.1.8:8000/";
const baseUrl = "${baseServ}api/";
const auth = "auth/";
const dashboard = 'dashboard/';
const delete = 'destroy/';

class AppUrl {
  /*>>>>>>>>>>>>>>>>>>>> Auth <<<<<<<<<<<<<<<<<<<<*/
  static const requestCode = '$baseUrl${auth}request-code';
  static const verifyCode = '$baseUrl${auth}verify-code';
  /*>>>>>>>>>>>>>>>>>>>> Directors <<<<<<<<<<<<<<<<<<<<*/
  static const creatDirector = '$baseUrl${dashboard}director/store';
  static const getDirectorsList = '$baseUrl${dashboard}director';
  static const deleteDirector = '$baseUrl${dashboard}director/$delete';
  /*>>>>>>>>>>>>>>>>>>>> Doctors <<<<<<<<<<<<<<<<<<<<*/
  static const creatDoctor = '$baseUrl${dashboard}doctor/store';
  static const getDoctorsList = '$baseUrl${dashboard}doctor';
  static const deleteDoctor = '$baseUrl${dashboard}doctor/$delete';
  /*>>>>>>>>>>>>>>>>>>>> Patients <<<<<<<<<<<<<<<<<<<<*/
  static const creatPatient = '$baseUrl${dashboard}patient/store';
  static const getPatientsList = '$baseUrl${dashboard}patient';
  static const deletePatient = '$baseUrl${dashboard}patient/$delete';
  /*>>>>>>>>>>>>>>>>>>>> Receptionist <<<<<<<<<<<<<<<<<<<<*/
  static const creatReceptionist = "$baseUrl${dashboard}receptionist/store";
  static const getReceptionsList = '$baseUrl${dashboard}receptionist';
  static const deleteReceptionist = '$baseUrl${dashboard}receptionist/$delete';
  /*>>>>>>>>>>>>>>>>>>>> Lab Master <<<<<<<<<<<<<<<<<<<<*/
  static const creatLabMaster = "$baseUrl${dashboard}lab-master/store";
  static const getLabMastersList = '$baseUrl${dashboard}lab_master';
  static const deleteLabMaster = '$baseUrl${dashboard}lab_master/$delete';
  /*>>>>>>>>>>>>>>>>>>>> Sections <<<<<<<<<<<<<<<<<<<<*/
  static const createSection = "$baseUrl${dashboard}section/store";
  static const getSections = "$baseUrl${dashboard}section";
  static const getSectionInformation = "$baseUrl${dashboard}section/";
  static const updateSection = "$baseUrl${dashboard}section/update/";
  static const deleteSection = "$baseUrl${dashboard}section/";
}
