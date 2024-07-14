const baseServ = "http://192.168.1.17:8000/";
const baseUrl = "${baseServ}api/";
const auth = "auth/";
const dashboard = 'dashboard/';

class AppUrl {
  /*>>>>>>>>>>>>>>>>>>>> Auth <<<<<<<<<<<<<<<<<<<<*/
  static const requestCode = '$baseUrl${auth}request-code';
  static const verifyCode = '$baseUrl${auth}verify-code';
  /* Get List Of Users */
  static const getDirectorsList = '$baseUrl${dashboard}director';
}
