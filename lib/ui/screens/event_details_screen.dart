import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/utils/app_context.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/models/event.dart';
import '../../core/utils/app_routes.dart';
import '../../core/utils/firebase_utils/firebase_utils.dart';
import '../../providers/user_provider.dart';
import '../widgets/containers/custom_container.dart';
import '../widgets/custom_rows/custom_header.dart';

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({super.key});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var initialEvent = ModalRoute.of(context)!.settings.arguments as Event;
    var userProvider = Provider.of<UserProvider>(context);

    double height = context.height;
    double width = context.width;

    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseUtils.getEventCollection(uId: userProvider.currentUser!.uId)
              .doc(initialEvent.id)
              .snapshots(),
          builder: (context, snapshot) {

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }


            if (!snapshot.hasData || snapshot.data?.data() == null) {
              return const Center(child: Text("Event not found"));
            }

            var event = snapshot.data!.data()!;

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomHeader(
                      headerText: 'event_details'.tr(),
                      hasTrailing: true,
                      onDelete: () => deleteEvent(event),
                      onEdit: () => editEvent(event),
                    ),
                    SizedBox(height: height * 0.01),
                    CustomContainer(
                      borderRadius: 24,
                      containerHeight: height * 0.23,
                      image: event.imageName,
                      hasBackgroundImage: true,
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      event.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: height * 0.02),
                    CustomContainer(
                      containerHeight: height * 0.09,
                      borderRadius: 24,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.date_range_outlined,
                              color: Theme.of(context).cardColor,
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(DateFormat('d MMM yyyy').format(event.eventDate)),
                                Text(event.eventTime, style: Theme.of(context).textTheme.headlineSmall),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      'description'.tr(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: height * 0.01),
                    CustomContainer(
                      containerWidth: double.infinity,
                      borderRadius: 24,
                      containerHeight: height * 0.2,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(event.description, style: Theme.of(context).textTheme.headlineSmall),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void deleteEvent(Event event) {
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    FirebaseUtils.deleteEvent(userProvider.currentUser!.uId, event.id)
        .then((value) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("event_deleted_successfully".tr())),
      );
    });
  }

  void editEvent(Event event) {
    Navigator.pushNamed(
      context,
      AppRoutes.editEventScreen,
      arguments: event,
    );
  }
}