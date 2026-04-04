import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/utils/app_context.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/utils/list_utils.dart';
import '../../providers/theme_provider.dart';
import '../widgets/buttons/custom_elevated_button.dart';
import '../widgets/containers/custom_container.dart';
import '../widgets/custom_rows/custom_header.dart';
import '../widgets/custom_rows/date_time_row.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/list_views/horizontal_list_view.dart';

class AddEventScreen extends StatelessWidget {
  const AddEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    double height = context.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .start,
            spacing: height * 0.01,
            children: [
              CustomHeader(headerText:
              'add_event'.tr()
              ),
              CustomContainer(
                containerHeight: height * 0.23,
                image: themeProvider.isDark
                    ? ListUtils.darkImagesList[0]
                    : ListUtils.lightImagesList[0],
                hasBackgroundImage: true,
              ),
              HorizontalListView(),
              Text(
                'title'.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              CustomTextFormField(
                hintText: 'event_title'.tr(),
              ),
              Text(
                'description'.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              CustomTextFormField(
                hintText: 'event_description'.tr(),
                minLines: 6,
              ),
              DateTimeRow(icon: Icons.date_range,buttonText: 'choose_date'.tr(),titleText: 'event_date'.tr(),),
              DateTimeRow(icon: Icons.access_time_rounded,buttonText: 'choose_time'.tr(),titleText: 'event_time'.tr(),),
              CustomElevatedButton(
                onPressed: () {},
                child: Text('add_event'.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
