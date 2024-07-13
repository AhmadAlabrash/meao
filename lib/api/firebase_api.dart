import 'package:firebase_messaging/firebase_messaging.dart';


class FirebaseApi {

final _firebaseMessaging = FirebaseMessaging.instance;


Future <void> handleBackgroundMessage (RemoteMessage message) async {
print('Title:${message.notification?.title}'); 
print('Body: ${message.notification?.body}');
print('Payload: ${message.data}');
}

Future<void> initNotifications() async {

await _firebaseMessaging.requestPermission();
final fCMToken = await _firebaseMessaging.getToken(); 
print('Token: $fCMToken');
FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);


}
}

//dXoI3JeZSoy_dhPoIMpu5T:APA91bEi1Hun3MBwAyZnu0Adq0ReNInXNCt4JYWDl57p-Q0LX57pL7WyVZCFOJKMVOpoa-W3RaKcjX-_3MgKVyBwPS4csY7YDo5SY2xw7Ou_D-eB8oPnSuGCkd4AdbYzkF7GCKl2vs4u