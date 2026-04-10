import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/models/event.dart';

import '../../models/app_user.dart';

class FirebaseUtils {
  static CollectionReference<Event> getEventCollection({required String uId}){
   return FirebaseFirestore.instance.collection(AppUser.collectionName) // Users
       .doc(uId).collection(Event.collectionName).withConverter<Event>(
      fromFirestore: (snapshot, _) => Event.fromFireStore(snapshot.data()!),
      toFirestore: (event, _) => event.toFireStore(),
    );
  }
  static Future<void> addEvent({required Event event,required String uId}){
    var collection = getEventCollection(uId: uId);
    var docRef = collection.doc();
    event.id = docRef.id;
    return docRef.set(event);
}
  static Stream<QuerySnapshot<Event>> getEvents({String? categoryName,required String uId}) {
    Query<Event> query = getEventCollection(uId: uId);
    if (categoryName != null&& categoryName != 'all'.tr()) {
      query = query.where('eventName', isEqualTo: categoryName);
    }
    return query.orderBy('eventDate').snapshots();
  }
static Stream<QuerySnapshot<Event>> getFavoriteEvents({required String uId}) {
    return getEventCollection(uId: uId).where('isFavorite', isEqualTo: true).orderBy('eventDate').snapshots();
  }

  static Future<void> updateFavorite({required Event event,required String uId}) {
    return getEventCollection(uId: uId).doc(event.id).update({
      'isFavorite': !event.isFavorite,
    });
  
}
  static Future<void> deleteEvent(String uId, String eventId) {
    return getEventCollection(uId: uId).doc(eventId).delete();
  }
  static Future<void> editEvent(String uId, Event event) {
    return getEventCollection(uId: uId).doc(event.id).update(event.toFireStore());
  }

}