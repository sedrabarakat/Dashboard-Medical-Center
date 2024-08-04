import 'package:equatable/equatable.dart';

import '../../data/model/session_model.dart';

// Session Cubit State
class SessionState extends Equatable {
  const SessionState();

  @override
  List<Object> get props => [];
}

final class SessionInitial extends SessionState{}

final class GetOpenSessionLoadingState extends SessionState{}
final class GetOpenSessionSuccessState extends SessionState{
  final List<Session> sessions;
  const GetOpenSessionSuccessState(this.sessions);

  @override
  List<Object> get props => [sessions];
}
final class GetOpenSessionErrorState extends SessionState{
  final String error;

  const GetOpenSessionErrorState (this.error);

  @override
  List<Object> get props => [error];
}

final class AddSessionSuccess extends SessionState{}
final class AddSessionError extends SessionState{
  final String error;

  const AddSessionError (this.error);

  @override
  List<Object> get props => [error];
}

final class CloseSessionSuccess extends SessionState{}
final class CloseSessionError extends SessionState{
  final String error;

  const CloseSessionError (this.error);

  @override
  List<Object> get props => [error];
}

final class FileUploadSuccessState extends SessionState {
  final String response;
  const FileUploadSuccessState(this.response);
}

final class FileUploadErrorState extends SessionState {
  final String error;
  const FileUploadErrorState(this.error);
}



