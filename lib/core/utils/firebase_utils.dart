import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/models/event.dart';

class FirebaseUtils {
  static CollectionReference<Event> getEventCollection(){
   return FirebaseFirestore.instance.collection(Event.collectionName).withConverter<Event>(
      fromFirestore: (snapshot, _) => Event.fromFireStore(snapshot.data()!),
      toFirestore: (event, _) => event.toFireStore(),
    );
  }
  static Future<void> addEvent(Event event){
    var collection = getEventCollection();
    var docRef = collection.doc();
    event.id = docRef.id;
    return docRef.set(event);
}
  static Stream<QuerySnapshot<Event>> getEvents({String? categoryName}) {
    Query<Event> query = getEventCollection();
    if (categoryName != null&& categoryName != 'all'.tr()) {
      query = query.where('eventName', isEqualTo: categoryName);
    }
    return query.orderBy('eventDate').snapshots();
  }
static Stream<QuerySnapshot<Event>> getFavoriteEvents() {
    return getEventCollection().where('isFavorite', isEqualTo: true).orderBy('eventDate').snapshots();
  }

  static Future<void> updateFavorite(Event event) {
    return getEventCollection().doc(event.id).update({
      'isFavorite': !event.isFavorite,
    });
  
}
}