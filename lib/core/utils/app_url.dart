const baseServ = "http://192.168.1.17:8000/";
const baseUrl = "${baseServ}api/";
const auth = "auth/";

class AppUrl {
  /*>>>>>>>>>>>>>>>>>>>> Auth <<<<<<<<<<<<<<<<<<<<*/
  static const requestCode = '$baseUrl${auth}request-code';
  static const verifyCode = '$baseUrl${auth}verify-code';
}
