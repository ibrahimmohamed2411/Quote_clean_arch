// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:quotes/core/error/exceptions.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:quotes/features/random_quote/data/models/quote_model.dart';

abstract class RandomQuoteLocalDataSource {
  Future<QuoteModel> getLastQuote();
  Future<void> cacheQuote(QuoteModel quote);
}

class RandomQuoteLocalDataSourceImp implements RandomQuoteLocalDataSource {
  final SharedPreferences sharedPreferences;
  RandomQuoteLocalDataSourceImp({
    required this.sharedPreferences,
  });
  @override
  Future<QuoteModel> getLastQuote() {
    final jsonString =
        sharedPreferences.getString(AppStrings.cachedRandomQuote);
    if (jsonString != null) {
      final cacheRandomQuote = QuoteModel.fromJson(json.decode(jsonString));
      return Future.value(cacheRandomQuote);
    }
    throw CacheException();
  }

  @override
  Future<void> cacheQuote(QuoteModel quote) async {
    await sharedPreferences.setString(
      AppStrings.cachedRandomQuote,
      json.encode(quote.toJson()),
    );
  }
}
