import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/utils/app_context.dart';
import 'package:evently_app/core/utils/firebase_utils/firebase_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/models/event.dart';
import '../../core/utils/list_utils.dart';
import '../../providers/theme_provider.dart';
import '../../providers/user_provider.dart';
import '../widgets/buttons/custom_elevated_button.dart';
import '../widgets/containers/custom_container.dart';
import '../widgets/custom_rows/custom_header.dart';
import '../widgets/custom_rows/date_time_row.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/list_views/horizontal_list_view.dart';

class EditEventScreen extends StatefulWidget {
  const EditEventScreen({super.key});

  @override
  State<EditEventScreen> createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  String? selectedCategoryName;
  String? selectedImageName;
  int? selectedIndex;
  DateTime? selectedEventDate;
  String? formattedTime;

  bool isInitialized = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isInitialized) {
      var event = ModalRoute.of(context)!.settings.arguments as Event;

      titleController.text = event.title;
      descriptionController.text = event.description;

      selectedCategoryName = event.eventName;
      selectedImageName = event.imageName;
      selectedEventDate = event.eventDate;
      formattedTime = event.eventTime;

      selectedIndex = ListUtils.getDetailsCategoryList().indexOf(event.eventName);
      if (selectedIndex == -1) selectedIndex = 0;

      isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    var event = ModalRoute.of(context)!.settings.arguments as Event;
    var userProvider = Provider.of<UserProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);

    double width = context.width;
    double height = context.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomHeader(headerText: 'edit_event'.tr()),
                  SizedBox(height: height * 0.02),

                  CustomContainer(
                    borderRadius: 24,
                    containerHeight: height * 0.23,
                    image: selectedImageName!,
                    hasBackgroundImage: true,
                  ),

                  SizedBox(height: height * 0.02),

                  HorizontalListView(
                    initialIndex: selectedIndex,
                    iconsList: ListUtils.getDetailsIcons(),
                    categoryList: ListUtils.getDetailsCategoryList(),
                    onCategoryChanged: (index) {
                      setState(() {
                        selectedIndex = index;
                        selectedCategoryName = ListUtils.getDetailsCategoryList()[selectedIndex!];

                        selectedImageName = themeProvider.isDark
                            ? ListUtils.darkImagesList[selectedIndex!]
                            : ListUtils.lightImagesList[selectedIndex!];
                      });
                    },
                  ),

                  Text('title'.tr(), style: Theme.of(context).textTheme.titleMedium),
                  CustomTextFormField(
                    controller: titleController,
                    hintText: 'enter_event_title'.tr(),
                  ),

                  Text('description'.tr(), style: Theme.of(context).textTheme.titleMedium),
                  CustomTextFormField(
                    controller: descriptionController,
                    hintText: 'enter_event_description'.tr(),
                    minLines: 4,
                  ),

                  DateTimeRow(
                    icon: Icons.date_range,
                    buttonText: DateFormat('dd/MM/yyyy').format(selectedEventDate!),
                    titleText: 'event_date'.tr(),
                    onPressed: () => chooseEventDate(context),
                  ),

                  DateTimeRow(
                    icon: Icons.access_time_rounded,
                    buttonText: formattedTime!,
                    titleText: 'event_time'.tr(),
                    onPressed: () => chooseEventTime(context),
                  ),

                  SizedBox(height: height * 0.02),

                  CustomElevatedButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() == true) {
                        Event updatedEvent = Event(
                          id: event.id,
                          title: titleController.text,
                          description: descriptionController.text,
                          eventDate: selectedEventDate!,
                          eventTime: formattedTime!,
                          eventName: selectedCategoryName!,
                          imageName: selectedImageName!,
                          isFavorite: event.isFavorite,
                        );

                        FirebaseUtils.editEvent(
                            userProvider.currentUser!.uId,
                            updatedEvent
                        ).then((value) {
                          Navigator.pop(context);
                        });
                      }
                    },
                    child: Text('update_event'.tr()),
                  ),
                  SizedBox(height: height * 0.02),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<void> chooseEventDate(BuildContext context) async {
    var date = await showDatePicker(
      context: context,
      initialDate: selectedEventDate!,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date != null) {
      setState(() {
        selectedEventDate = date;
      });
    }
  }

  Future<void> chooseEventTime(BuildContext context) async {
    var time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      setState(() {
        formattedTime = time.format(context);
      });
    }
  }
}