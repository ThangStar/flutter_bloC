import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/user.dart';

part 'detail_screen_event.dart';

part 'detail_screen_state.dart';

class DetailScreenBloc extends Bloc<DetailScreenEvent, DetailScreenState> {
  DetailScreenBloc() : super(DetailScreenInitial()) {
    on<OnSetData>(_onSetDataButtonClicked);

    on<OnUpdataData>(_onUpdateData);
    on<OnRemoveData>(_onRemoveData);
    on<OnSendIndex>(_onSendIndex);

  }

  FutureOr<void> _onSetDataButtonClicked(
      OnSetData event, Emitter<DetailScreenState> emit) {
    List<User> newValue = [...state.listUser, User()];
    emit(DetailScreenState(listUser: newValue ));
  }

  FutureOr<void> _onUpdateData(event, Emitter<DetailScreenState> emit) {
    List<User> newList = List.from(state.listUser)..removeAt(0)..insert(0, User(name: "new name"));
    emit(DetailScreenState(listUser: newList));
  }

  FutureOr<void> _onRemoveData(OnRemoveData event, Emitter<DetailScreenState> emit) {

    List<User> newList = List.from(state.listUser)..removeAt(0);
    emit(DetailScreenState(listUser: newList));
  }

  FutureOr<void> _onSendIndex(OnSendIndex event, Emitter<DetailScreenState> emit) {
    print("Index is: ${event.index}");
  }
}
