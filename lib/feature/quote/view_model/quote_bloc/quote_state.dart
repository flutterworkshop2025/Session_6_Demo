import '../../data/model/qoute.dart';

abstract class QuoteState {}

class InitialState extends QuoteState {}

class LoadingState extends QuoteState {}

class SuccessState extends QuoteState {
  final List<Qoute> qoutes;
  SuccessState(this.qoutes);
}

class FailureState extends QuoteState {
  String message;

  FailureState({required this.message});
}
