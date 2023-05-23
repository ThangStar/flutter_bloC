part of 'home_screen_bloc.dart';

class HomeScreenState extends Equatable {
  int counter = 0;
  HomeScreenState({this.counter = 0});

  @override
  List<Object> get props => [counter];
}

class HomeScreenInitial extends HomeScreenState {
  HomeScreenInitial({super.counter});
}
