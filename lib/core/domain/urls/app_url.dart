const baseServ = "http://192.168.137.199:8000/";
const baseUrl = "${baseServ}api/";
const auth = "auth/";
const dashboard = 'dashboard/';
const delete = 'destroy/';
const session = 'session/' ;
const appintment = 'appointment' ;

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
  static const creatPatient= '$baseUrl${dashboard}patient/store';
  static const getPatientsList = '$baseUrl${dashboard}patient';
  static const deletePatient = '$baseUrl${dashboard}patient/$delete';
  /*>>>>>>>>>>>>>>>>>>>> Receptionist <<<<<<<<<<<<<<<<<<<<*/
  static const creatReceptionist="$baseUrl${dashboard}receptionist/store";
  /*>>>>>>>>>>>>>>>>>>>> Receptionist <<<<<<<<<<<<<<<<<<<<*/
  static const creatLabMaster="$baseUrl${dashboard}lab-master/store";
  /*>>>>>>>>>>>>>>>>>>>>  Session <<<<<<<<<<<<<<<<<<<<<<<*/
  static const addSession = "$baseUrl$dashboard${session}add/" ;
  static const closeSession ="$baseUrl$dashboard${session}close/" ;
  static const getOpenSessionForAPatient = "$baseUrl$dashboard${session}open-sessions/" ;
  static const uploadFile = '$baseUrl$dashboard${session}upload-file/';
  /*>>>>>>>>>>>>>>>>>>>> Appointment <<<<<<<<<<<<<<<<<<<<<<<<<<<*/
  static const getAppointment = "$baseUrl$dashboard$appintment" ;
}
