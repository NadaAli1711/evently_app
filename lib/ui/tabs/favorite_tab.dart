
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../core/utils/app_context.dart';
import '../../core/utils/firebase_utils.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/event_stream_builder.dart';

class FavoriteTab extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    double height = context.height;
    return Column(
      spacing: height * 0.025,
      children: [
        CustomTextFormField(
          controller: searchController,
          hintText: 'search_for_event'.tr(),
          suffixIcon: Icon(Icons.search),
          suffixIconColor: Theme.of(context).cardColor,
        ),
        EventStreamBuilder(stream: FirebaseUtils.getFavoriteEvents(),)
      ],
    );
  }
}
