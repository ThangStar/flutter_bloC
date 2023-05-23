import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_app/futures/network/api/neko_api.dart';
import 'package:bloc_app/futures/network/utils/response.dart';
import 'package:bloc_app/futures/screens/neko/model/neko.dart';
import 'package:equatable/equatable.dart';

part 'neko_screen_event.dart';

part 'neko_screen_state.dart';

class NekoScreenBloc extends Bloc<NekoScreenEvent, NekoScreenState> {
  NekoScreenBloc() : super(NekoScreenInitial(listNeko: const [])) {
    on<LoadDataNeko>(_loadDataNeko);
  }

  FutureOr<void> _loadDataNeko(
      LoadDataNeko event, Emitter<NekoScreenState> emit) async {
    print("im there");
    final response = await NekoApi.getDataNeko();
    if (response is Success) {
      final result = Result.fromRawJson(response.body);
      final listNeko = result.results;
      emit(NekoScreenState(listNeko: listNeko, isLoading: false));
      listNeko.forEach((it) {
        print("URL: ${it.url}");
      });
    } else {
      print("failure");
      emit(NekoScreenState(listNeko: [], isLoading: false));
    }
  }
}
