import 'package:belajar_1/core/error/failure.dart';
import 'package:belajar_1/core/utils/generics/bloc_status.dart';
import 'package:belajar_1/core/utils/generics/no_input.dart';
import 'package:belajar_1/domain/entities/poli.dart';
import 'package:belajar_1/domain/usecase/poli/delete_poli_usecase.dart';
import 'package:belajar_1/domain/usecase/poli/edit_poli_usecase.dart';
import 'package:belajar_1/domain/usecase/poli/get_poli_by_id_usecase.dart';
import 'package:belajar_1/domain/usecase/poli/get_poli_list_usecase.dart';
import 'package:belajar_1/domain/usecase/poli/save_poli_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'poli_bloc_event.dart';
part 'poli_bloc_state.dart';

class PoliBloc extends Bloc<PoliBlocEvent, PoliBlocState> {
  PoliBloc({
    required this.deletePoliUseCase,
    required this.editPoliUseCase,
    required this.getByIdPoliUseCase,
    required this.getListPoliUseCase,
    required this.savePoliUseCase,
  }) : super(const PoliBlocState(status: Status.empty)) {
    on<OnPoliGetList>(getListPoli);
    on<OnPoliGetItemById>(getByIdPoli);
    on<OnPoliSave>(savePoli);
    on<OnPoliEdit>(editPoli);
    on<OnPoliDelete>(deletePoli);
  }

  final DeletePoliUseCase deletePoliUseCase;
  final EditPoliUseCase editPoliUseCase;
  final GetByIdPoliUseCase getByIdPoliUseCase;
  final GetListPoliUseCase getListPoliUseCase;
  final SavePoliUseCase savePoliUseCase;

  Future<void> getListPoli(OnPoliGetList event, Emitter<PoliBlocState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var result = await getListPoliUseCase(NoInput());

    if (result.isSuccess()) {
      emit(state.copyWith(status: Status.loaded, datas: result.getSuccess()));
    } else {
      if (result.getError() is ServerFailure) {
        emit(state.copyWith(status: Status.serverError));
      } else if (result.getError() is NotConnectedFailure) {
        emit(state.copyWith(status: Status.networkError));
      }
    }
  }

  Future<void> getByIdPoli(OnPoliGetItemById event, Emitter<PoliBlocState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var result = await getByIdPoliUseCase(event.id);

    if (result.isSuccess()) {
      emit(state.copyWith(status: Status.loaded, data: result.getSuccess()));
    } else {
      if (result.getError() is ServerFailure) {
        emit(state.copyWith(status: Status.serverError));
      } else if (result.getError() is NotConnectedFailure) {
        emit(state.copyWith(status: Status.networkError));
      }
    }
  }

  Future<void> savePoli(OnPoliSave event, Emitter<PoliBlocState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var result = await savePoliUseCase(event.poli);

    if (result.isSuccess()) {
      emit(state.copyWith(status: Status.loaded, data: result.getSuccess()));
    } else {
      if (result.getError() is ServerFailure) {
        emit(state.copyWith(status: Status.serverError));
      } else if (result.getError() is NotConnectedFailure) {
        emit(state.copyWith(status: Status.networkError));
      }
    }
  }

  Future<void> editPoli(OnPoliEdit event, Emitter<PoliBlocState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var result = await editPoliUseCase(event.poli);

    if (result.isSuccess()) {
      emit(state.copyWith(status: Status.loaded, data: result.getSuccess()));
    } else {
      if (result.getError() is ServerFailure) {
        emit(state.copyWith(status: Status.serverError));
      } else if (result.getError() is NotConnectedFailure) {
        emit(state.copyWith(status: Status.networkError));
      }
    }
  }

  Future<void> deletePoli(OnPoliDelete event, Emitter<PoliBlocState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var result = await deletePoliUseCase(event.poli);

    if (result.isSuccess()) {
      emit(state.copyWith(status: Status.loaded, data: result.getSuccess()));
    } else {
      if (result.getError() is ServerFailure) {
        emit(state.copyWith(status: Status.serverError));
      } else if (result.getError() is NotConnectedFailure) {
        emit(state.copyWith(status: Status.networkError));
      }
    }
  }
}
