import 'package:maimaiid_test/Model/model_user.dart';

abstract class UserState {
  const UserState();
}

class UserLoading extends UserState {
  const UserLoading();
  List<Object>? get props => null;
}

class UserLoaded extends UserState {
  final UserModel userModel;
  const UserLoaded(this.userModel);
  List<Object> get props => [userModel];
}

class UserDetail extends UserState {
  final UserDetail userModel;
  const UserDetail(this.userModel);
  List<Object> get props => [userModel];
}

class UserInitial extends UserState {
  const UserInitial();
  List<Object> get props => [];
}

class UserError extends UserState {
  final String message;

  UserError(this.message);
  List<Object> get props => [message];
}
