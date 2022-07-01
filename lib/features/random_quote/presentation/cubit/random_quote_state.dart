// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'random_quote_cubit.dart';

abstract class RandomQuoteState extends Equatable {
  const RandomQuoteState();

  @override
  List<Object> get props => [];
}

class RandomQuoteInitial extends RandomQuoteState {}

class RandomQuoteLoading extends RandomQuoteState {}

class RandomQuoteLoaded extends RandomQuoteState {
  final Quote quote;
  RandomQuoteLoaded({
    required this.quote,
  });
  @override
  List<Object> get props => [quote];
}

class RandomQuoteError extends RandomQuoteState {
  final String msg;
  RandomQuoteError({
    required this.msg,
  });
  @override
  List<Object> get props => [msg];
}
