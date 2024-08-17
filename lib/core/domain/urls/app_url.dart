// const baseServ = "http://127.0.0.1:8001/";
const baseServ = "http://192.168.1.101:8000/";

const baseUrl = "${baseServ}api/";
const auth = "auth/";
const dashboard = 'dashboard/';
const delete = 'destroy/';
const session = 'session/';
const appintment = 'appointment';

class AppUrl {
  /*>>>>>>>>>>>>>>>>>>>> Auth <<<<<<<<<<<<<<<<<<<<*/
  static const requestCode = '$baseUrl${auth}request-code';
  static const verifyCode = '$baseUrl${auth}verify-code';
  /*>>>>>>>>>>>>>>>>>>>> Directors <<<<<<<<<<<<<<<<<<<<*/
  static const creatDirector = '$baseUrl${dashboard}director/store';
  static const getDirectorsList = '$baseUrl${dashboard}director';
  static const deleteDirector = '$baseUrl${dashboard}director/';
  /*>>>>>>>>>>>>>>>>>>>> Doctors <<<<<<<<<<<<<<<<<<<<*/
  static const creatDoctor = '$baseUrl${dashboard}doctor/store';
  static const getDoctorsList = '$baseUrl${dashboard}doctor';
  static const deleteDoctor = '$baseUrl${dashboard}doctor/$delete';
  static const updateDoctor = '$baseUrl${dashboard}doctor/update/';
  static const getDoctorProfile = '$baseUrl${dashboard}doctor/';
  static const postDoctorSchedule = '$baseUrl${dashboard}doctor/';
  static const getDoctorSchedule = '$baseUrl${dashboard}doctor/';
  /*>>>>>>>>>>>>>>>>>>>> Patients <<<<<<<<<<<<<<<<<<<<*/
  static const creatPatient = '$baseUrl${dashboard}patient/store';
  static const getPatientsList = '$baseUrl${dashboard}patient';
  static const deletePatient = '$baseUrl${dashboard}patient/$delete';
  static const getPatientProfile = '$baseUrl${dashboard}patient/';
  static const updatePatientProfile = '$baseUrl${dashboard}patient/update/';
  /*>>>>>>>>>>>>>>>>>>>> Receptionist <<<<<<<<<<<<<<<<<<<<*/
  static const creatReceptionist = "$baseUrl${dashboard}receptionist/store";
  static const getReceptionsList = '$baseUrl${dashboard}receptionist';
  static const deleteReceptionist = '$baseUrl${dashboard}receptionist/';
  /*>>>>>>>>>>>>>>>>>>>> Lab Master <<<<<<<<<<<<<<<<<<<<*/
  static const creatLabMaster = "$baseUrl${dashboard}lab_master/store";
  static const getLabMastersList = '$baseUrl${dashboard}lab_master';
  static const deleteLabMaster = '$baseUrl${dashboard}lab_master/';
  /*>>>>>>>>>>>>>>>>>>>> Sections <<<<<<<<<<<<<<<<<<<<*/
  static const createSection = "$baseUrl${dashboard}section/store";
  static const getSections = "$baseUrl${dashboard}section";
  static const getSectionInformation = "$baseUrl${dashboard}section/";
  static const updateSection = "$baseUrl${dashboard}section/update/";
  static const deleteSection = "$baseUrl${dashboard}section/destroy/";
/*>>>>>>>>>>>>>>>>>>>>  Services <<<<<<<<<<<<<<<<<<<<<<<*/
  static const createService = "$baseUrl${dashboard}service/store";
  static const editService = "$baseUrl${dashboard}service/update/";
  static const deleteService = "$baseUrl${dashboard}service/destroy/";
  //static const deleteSection = "$baseUrl${dashboard}section/";
  /*>>>>>>>>>>>>>>>>>>>>  Session <<<<<<<<<<<<<<<<<<<<<<<*/
  static const addSession = "$baseUrl$dashboard${session}add/";
  static const closeSession = "$baseUrl$dashboard${session}close/";
  static const getOpenSessionForAPatient =
      "$baseUrl$dashboard${session}open-sessions/";
  static const uploadFile = '$baseUrl$dashboard${session}upload-file/';
  /*>>>>>>>>>>>>>>>>>>>> Appointment <<<<<<<<<<<<<<<<<<<<<<<<<<<*/
  static const getAppointment = "$baseUrl$dashboard$appintment";
  static const deleteAppointment = '$baseUrl${dashboard}appointment/$delete';
  static const updateAppointment = '$baseUrl${dashboard}appointment/update/';
  static const getDoctorScheduleTime = '$baseUrl${dashboard}doctor/schedule/';

  /*>>>>>>>>>>>>>>>>>>>> Lab <<<<<<<<<<<<<<<<<<<<<<<<<<<*/
  static const getLabRequest = "$baseUrl${dashboard}lab/sessions-details";
  static const makeItDone = "$baseUrl${dashboard}lab/done/";
  static const makeItFail = "$baseUrl${dashboard}lab/fail/";
  static const getServices = '$baseUrl${dashboard}service';
  static const uploadLabFile = '$baseUrl${dashboard}session/details/';
}
