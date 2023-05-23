part of 'neko_screen_bloc.dart';

class NekoScreenState extends Equatable {
  List<Neko> listNeko;
  bool isLoading;

  NekoScreenState({required this.listNeko, this.isLoading = true});

  @override
  List<Object> get props => [listNeko, isLoading];
}

class NekoScreenInitial extends NekoScreenState {
  NekoScreenInitial({required super.listNeko});
}
