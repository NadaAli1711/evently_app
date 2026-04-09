import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../core/models/event.dart';
import 'list_views/vertical_list_view.dart';

class EventStreamBuilder extends StatelessWidget {
  final Stream<QuerySnapshot<Event>> stream;
  const EventStreamBuilder({super.key, required this.stream});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot<Event>>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text('Error');
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          var eventsList =
              snapshot.data?.docs.map((doc) => doc.data()).toList() ?? [];
          return eventsList.isEmpty? Text('No Data Found'): VerticalListView(eventsList: eventsList);
        },
      ),
    );
  }
}
