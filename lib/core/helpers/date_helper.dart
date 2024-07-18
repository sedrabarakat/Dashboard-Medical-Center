import 'package:intl/intl.dart';

class DateHelper{
  static String Convert_DateTime_DashString({
    required DateTime dateTime
}){
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    return formattedDate;
  }
}