import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/models/event.dart';
import 'package:evently_app/core/utils/app_context.dart';
import 'package:evently_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/firebase_utils/firebase_utils.dart';
import '../../../providers/user_provider.dart';
import '../containers/custom_container.dart';

class VerticalListView extends StatefulWidget {
  final List<Event> eventsList;
  const VerticalListView({super.key,required this.eventsList});

  @override
  State<VerticalListView> createState() => _VerticalListViewState();
}

class _VerticalListViewState extends State<VerticalListView> {
  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    double height = context.height;
    double width = context.width;
    var userProvider = Provider.of<UserProvider>(context);
    return ListView.separated(
      itemBuilder: (context, index) {
        Event currentEvent = widget.eventsList[index];
        return InkWell(
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.eventDetailsScreen,arguments: currentEvent),
          child: CustomContainer(
          image: currentEvent.imageName,
          hasBackgroundImage: true,
          borderRadius: 16,
          horizontalPadding: width * 0.02,
          verticalPadding: height * 0.02,
          containerHeight: height * 0.23,
          child: Column(
            mainAxisAlignment: .spaceBetween,
            crossAxisAlignment: .start,
            children: [
              CustomContainer(
                containerHeight: height * 0.05,
                child: Text(
                  '${ DateFormat('d MMM').format(currentEvent.eventDate!)}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              CustomContainer(
                containerHeight: height * 0.07,
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      '${currentEvent.description}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    IconButton(
                      onPressed: () {
                        FirebaseUtils.updateFavorite(uId: userProvider.currentUser!.uId,event: currentEvent);
                      },
                      icon: Icon(
                        currentEvent.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
                ),
        );},

      separatorBuilder: (context, index) => SizedBox(height: height * 0.02),
      itemCount: widget.eventsList.length,
    );
  }
}
