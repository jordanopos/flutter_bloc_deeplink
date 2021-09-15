part of 'deeplink_bloc.dart';

@immutable
abstract class DeeplinkState extends Equatable{}

class DeeplinkInitial extends DeeplinkState {
  @override
  List<Object> get props => null;
}

class InitialDeepLinkFound extends DeeplinkState {
  final Post post;
  InitialDeepLinkFound({@required this.post});

  @override
  List<Object> get props => [post];
}

class DeepLinkError extends DeeplinkState {
  final Error error;
  DeepLinkError({this.error});

  @override
  List<Object> get props => null;
}
