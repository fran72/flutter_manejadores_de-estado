part of 'user_bloc.dart';

@immutable
abstract class UserEvents {}

class ActivateUser extends UserEvents {
  final Usuario user;

  ActivateUser({required this.user});
}

class ChangeUserAge extends UserEvents {
  final int age;

  ChangeUserAge({required this.age});
}

class AddProfession extends UserEvents {
  final String profesion;

  AddProfession({required this.profesion});
}

class DeleteUser extends UserEvents {
  DeleteUser();
}
