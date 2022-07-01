import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/config/locale/app_localizations_setup.dart';
import 'package:quotes/config/routes/app_routes.dart';
import 'package:quotes/features/splash/presentation/cubit/local_cubit.dart';

import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'injection_container.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocalCubit>(
          create: (context) => sl<LocalCubit>()..getSavedLang(),
        ),
      ],
      child: BlocBuilder<LocalCubit, LocalState>(
        buildWhen: ((previous, current) => previous != current),
        builder: (context, state) {
          return MaterialApp(
            title: AppStrings.appName,
            theme: appTheme(),
            onGenerateRoute: AppRoutes().onGenerateRoute,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localeResolutionCallback:
                AppLocalizationsSetup.localeResolutionCallback,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
            locale: state.locale,
          );
        },
        
      ),
    );
  }
}
