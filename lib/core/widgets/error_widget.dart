import 'package:flutter/material.dart';
import 'package:quotes/config/locale/app_localizations.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/core/utils/media_query_values.dart';

class ErrorWidget extends StatelessWidget {
  final VoidCallback? onPress;
  const ErrorWidget({Key? key, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Icon(
            Icons.warning,
            color: AppColors.primary,
            size: 150,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 12),
          child: Text(
            AppLocalizations.of(context)!.translate('something_went_wrong')!,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Text(
          AppLocalizations.of(context)!.translate('try_again')!,
          style: TextStyle(
            color: AppColors.hint,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          height: 55,
          width: context.width * 0.55,
          margin: EdgeInsets.symmetric(vertical: 15),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: AppColors.primary,
              onPrimary: Theme.of(context).primaryColor,
              elevation: 500,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: Text(
              AppLocalizations.of(context)!.translate('reload_screen')!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              if (onPress != null) {
                onPress!();
              }
            },
          ),
        ),
      ],
    );
  }
}
