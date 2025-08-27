import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/qoute.dart';
import '../../data/repository/qoute_repository.dart';
import 'quote_state.dart';
import 'package:dio/dio.dart';

class QuoteCubit extends Cubit<QuoteState> {
  QuoteCubit(this.qouteRepository) : super(InitialState());

  final QouteRepository qouteRepository;

  Future<void> loadQoutes() async {
    try {
      emit(LoadingState());
      //load
      final List<Qoute> qoutes = await qouteRepository.loadQoute();
      emit(SuccessState(qoutes));
    } catch (e) {
      emit(FailureState(message: e.toString()));
    }
  }
}
