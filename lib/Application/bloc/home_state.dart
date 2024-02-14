part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required List<FireBaseModel> snapshot,
    required bool err,
  }) = _HomeState;

  factory HomeState.initial() {
    return const HomeState(snapshot: [], err: false);
  }
}
