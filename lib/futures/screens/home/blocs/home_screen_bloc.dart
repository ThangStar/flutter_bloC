import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitial()) {
    on<PlusSizeList>(_plusSizeList);
  }

  FutureOr<void> _plusSizeList(PlusSizeList event, Emitter<HomeScreenState> emit) {
    emit(HomeScreenState(counter: state.counter + 1));
    print(state.counter);
  }
}
