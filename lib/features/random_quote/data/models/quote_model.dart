import 'package:quotes/features/random_quote/domain/entities/quote.dart';

class QuoteModel extends Quote {
  QuoteModel({
    required String author,
    required int id,
    required String content,
    required String permalink,
  }) : super(
          author: author,
          id: id,
          content: content,
          permalink: permalink,
        );

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      author: json['author'] ?? 'author',
      id: json['id'] ?? 1,
      content: json['quote'] ?? 'quote',
      permalink: json['permalink'] ?? 'permalink',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'id': id,
      'quote': content,
      'permalink': permalink,
    };
  }
}
