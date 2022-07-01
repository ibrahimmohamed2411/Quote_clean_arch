import 'package:flutter/material.dart';
import 'package:quotes/features/random_quote/domain/entities/quote.dart';
import '../../../../core/utils/app_colors.dart';

class QuoteContent extends StatelessWidget {
  final Quote quote;
  QuoteContent({Key? key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 22, horizontal: 25),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Text(
            quote.content,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              quote.author,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
