part of 'detail_screen_bloc.dart';

class DetailScreenState extends Equatable {
  List<User> listUser = [];

  DetailScreenState({this.listUser = const [] });

  @override
  List<Object> get props => [listUser];
}

class DetailScreenInitial extends DetailScreenState {}
