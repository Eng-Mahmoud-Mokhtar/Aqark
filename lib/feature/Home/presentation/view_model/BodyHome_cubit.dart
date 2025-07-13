import 'package:bloc/bloc.dart';
import 'BodyHome_state.dart';
import 'views/Widget/buildImages.dart';

class BodyHomeCubit extends Cubit<BodyHomeState> {
  BodyHomeCubit() : super(BodyHomeInitial());

  void loadData() async {
    emit(BodyHomeLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      if (homeImages.isEmpty) {
        emit(BodyHomeError());
      } else {
        emit(BodyHomeLoaded(homeImages: homeImages));
      }
    } catch (_) {
      emit(BodyHomeError());
    }
  }
}
