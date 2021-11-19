abstract class UserEvent {
  const UserEvent();
}

class GetUserList extends UserEvent {
  List<Object>? get props => null;
}

class GetUserDetail extends UserEvent {
  List<Object>? get props => null;
}
