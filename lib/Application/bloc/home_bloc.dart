import 'package:bloc/bloc.dart';

import 'package:fire_base_project/Domain/Home/i_firebaseModel_repo.dart';
import 'package:fire_base_project/Domain/Home/model/firebaseModel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IFirebaseRepo iFirebaseRepo;
  HomeBloc(this.iFirebaseRepo) : super(HomeState.initial()) {
    on<_Started>((event, emit) async {
      if (state.snapshot.isNotEmpty) {
        return emit(state);
      }
      emit(const HomeState(snapshot: [], err: true));
      final result = await iFirebaseRepo.getAll();

      emit(HomeState(snapshot: result, err: false));
    });
    on<Created>((event, emit) async {
      emit(const HomeState(snapshot: [], err: true));
      final result = await iFirebaseRepo.getAll();

      emit(HomeState(snapshot: result, err: false));
    });
    on<Deleted>((event, emit) async {
      emit(const HomeState(snapshot: [], err: true));
      final result = await iFirebaseRepo.getAll();

      emit(HomeState(snapshot: result, err: false));
    });
  }
}
