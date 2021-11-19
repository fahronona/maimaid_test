import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maimaiid_test/Bloc/event.dart';
import 'package:maimaiid_test/Bloc/state.dart';
import 'package:maimaiid_test/Service/api_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(UserState initialState) : super(initialState);
  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is GetUserList) {
      try {
        yield const UserLoading();
        final userList = await ApiRepository().fetchUserlList("1");
        yield UserLoaded(userList);
      } catch (e) {
        yield UserError("Gagal Memuat Data");
      }
    }
  }
}
