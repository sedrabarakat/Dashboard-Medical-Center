import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';

abstract class inbox_states{}

class init_inbox_state extends inbox_states{}

class Loading_get_inbox extends inbox_states{}

class Success_get_inbox extends inbox_states{}

class Error_get_inbox extends inbox_states{
  NetworkExceptions error;
  Error_get_inbox(this.error);
}