import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../core/utils/app_context.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/list_views/vertical_list_view.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    double height = context.height;
    return Column(
      spacing: height * 0.025,
      children: [
        CustomTextFormField(
          hintText: 'search_for_event'.tr(),
          // hintText: AppLocalizations.of(context)!.search_for_event,
          suffixIcon: Icon(Icons.search),
          suffixIconColor: Theme.of(context).cardColor,
        ),
        Expanded(child: VerticalListView()),
      ],
    );
  }
}
