part of 'detail_screen_bloc.dart';

abstract class DetailScreenEvent {

}

class OnSetData extends DetailScreenEvent{}
class OnUpdataData extends DetailScreenEvent{}
class OnRemoveData extends DetailScreenEvent{}

class OnSendIndex extends DetailScreenEvent{
  int index;
  OnSendIndex({this.index = 0});
}