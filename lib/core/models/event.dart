 class Event {
  static const String collectionName = 'events';
   String id;
  final String title;
  final String eventName;
  final String description;
  final DateTime eventDate;
  final String eventTime;
  final String imageName;
  final bool isFavorite;
  Event({
    this.id = '',
    required this.title,
    required this.description,
    required this.eventTime,
    required this.eventDate,
    required this.eventName,
    required this.imageName,
    this.isFavorite = false,
  });
  Map<String,dynamic> toFireStore(){
    return {
      'id':id,
      'title':title,
      'description':description,
      'eventTime':eventTime,
      'eventName':eventName,
      'eventDate':eventDate.millisecondsSinceEpoch,
      'imageName':imageName,
      'isFavorite':isFavorite,
    };

  }
  Event.fromFireStore(Map<String,dynamic> data):this(
    id:data['id'],
    title: data['title'],
    description: data['description'],
    eventTime: data['eventTime'],
    eventName: data['eventName'],
    eventDate: DateTime.fromMillisecondsSinceEpoch(data['eventDate']),
    imageName: data['imageName'],
    isFavorite: data['isFavorite'],
  );
}
