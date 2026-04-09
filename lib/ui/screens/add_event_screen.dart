import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/utils/app_context.dart';
import 'package:evently_app/core/utils/firebase_utils.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/models/event.dart';
import '../../core/utils/list_utils.dart';
import '../../providers/theme_provider.dart';
import '../widgets/buttons/custom_elevated_button.dart';
import '../widgets/containers/custom_container.dart';
import '../widgets/custom_rows/custom_header.dart';
import '../widgets/custom_rows/date_time_row.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/list_views/horizontal_list_view.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  late String selectedCategoryName;
  late String selectedImageName;
  int selectedIndex = 0 ;
  DateTime? selectedEventDate;
  TimeOfDay? selectedEventTime;
  String? formattedTime;


  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    selectedImageName = themeProvider.isDark
        ? ListUtils.darkImagesList[selectedIndex]
        : ListUtils.lightImagesList[selectedIndex];
    double height = context.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: .start,
              spacing: height * 0.01,
              children: [
                CustomHeader(headerText: 'add_event'.tr()),
                CustomContainer(
                  containerHeight: height * 0.23,
                  image: selectedImageName,
                  hasBackgroundImage: true,
                ),
                HorizontalListView(
                  iconsList: ListUtils.getDetailsIcons(),
                  categoryList: ListUtils.getDetailsCategoryList(),
                  onCategoryChanged: (index) {
                    setState(() {
                      selectedIndex = index;
                      selectedCategoryName =  ListUtils.getDetailsCategoryList()[selectedIndex];
                    });
                  },
                ),
                Text(
                  'title'.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                CustomTextFormField(
                  controller: titleController,
                  hintText: 'event_title'.tr(),
                ),
                Text(
                  'description'.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                CustomTextFormField(
                  controller: descriptionController,
                  hintText: 'event_description'.tr(),
                  minLines: 6,
                ),
                DateTimeRow(
                  icon: Icons.date_range,
                  buttonText: selectedEventDate == null? 'choose_date'.tr() : DateFormat('MMM d,yyyy').format(selectedEventDate!),
                  titleText: 'event_date'.tr(),
                  onPressed: () => chooseEventDate(context),
                ),
                DateTimeRow(
                  icon: Icons.access_time_rounded,
                  buttonText: formattedTime == null ? 'choose_time'.tr(): formattedTime!,
                  titleText: 'event_time'.tr(),
                  onPressed: () => chooseEventTime(context),
                ),
                CustomElevatedButton(
                  onPressed: () {
                    if(formKey.currentState?.validate()==true) {
                      FirebaseUtils.addEvent(
                        Event(
                          title: titleController.text,
                          description: descriptionController.text,
                          eventDate: selectedEventDate!,
                          eventTime: '$selectedEventTime',
                          eventName: selectedCategoryName,
                          imageName: selectedImageName,
                        )
                      ).then((value) => Navigator.pop(context),);
                    }
                  },
                  child: Text('add_event'.tr()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> chooseEventDate(BuildContext context) async {

    selectedEventDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    setState(() {

    });
  }

  Future<void> chooseEventTime(BuildContext context) async {
    selectedEventTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    setState(() {
      formattedTime = selectedEventTime!.format(context);

    });
  }
}
