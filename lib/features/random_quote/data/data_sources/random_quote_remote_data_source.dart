import 'package:dio/dio.dart';
import 'package:quotes/core/api/end_points.dart';
import 'package:quotes/features/random_quote/data/models/quote_model.dart';

import '../../../../core/api/api_consumer.dart';

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImp implements RandomQuoteRemoteDataSource {
  final ApiConsumer apiConsumer;
  RandomQuoteRemoteDataSourceImp({
    required this.apiConsumer,
  });
  @override
  Future<QuoteModel> getRandomQuote() async {
    final response = await apiConsumer.get(EndPoints.randomQuote);
    return QuoteModel.fromJson(response);
  }
}
