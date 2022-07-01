import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:quotes/features/random_quote/presentation/screens/quote_screen.dart';
import 'package:quotes/features/splash/presentation/screens/splash_screen.dart';

import '../../injection_container.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String randomQuoteRoute = '/randomQuote';
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
      case randomQuoteRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<RandomQuoteCubit>(),
            child: QuoteScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
