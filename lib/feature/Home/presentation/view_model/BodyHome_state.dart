abstract class BodyHomeState {}

class BodyHomeInitial extends BodyHomeState {}

class BodyHomeLoading extends BodyHomeState {}

class BodyHomeLoaded extends BodyHomeState {
  final List<String> homeImages;
  BodyHomeLoaded({required this.homeImages});
}

class BodyHomeError extends BodyHomeState {}