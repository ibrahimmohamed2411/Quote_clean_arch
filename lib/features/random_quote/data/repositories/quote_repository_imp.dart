// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:quotes/core/error/failures.dart';
import 'package:quotes/core/network/network_info.dart';
import 'package:quotes/features/random_quote/data/data_sources/random_quote_local_data_source.dart';
import 'package:quotes/features/random_quote/data/data_sources/random_quote_remote_data_source.dart';
import 'package:quotes/features/random_quote/domain/entities/quote.dart';
import 'package:quotes/features/random_quote/domain/repositories/quote_repository.dart';

import '../../../../core/error/exceptions.dart';

class QuoteRepositoryImp implements QuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;
  QuoteRepositoryImp({
    required this.networkInfo,
    required this.randomQuoteRemoteDataSource,
    required this.randomQuoteLocalDataSource,
  });

  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteQuote = await randomQuoteRemoteDataSource.getRandomQuote();
        await randomQuoteLocalDataSource.cacheQuote(remoteQuote);
        return Right(remoteQuote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final cachedRandomQuote =
            await randomQuoteLocalDataSource.getLastQuote();
        return Right(cachedRandomQuote);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
