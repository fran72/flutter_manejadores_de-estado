part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool existUser;
  final Usuario user;

  const UserState({this.existUser = false, required this.user});
}

class UserInitialState extends UserState {
  UserInitialState()
      : super(
            existUser: false,
            user: Usuario(nombre: 'nombre', age: 0, profesiones: []));
}

class UserSetState extends UserState {
  const UserSetState(Usuario newUser) : super(existUser: true, user: newUser);
}
