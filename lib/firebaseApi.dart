import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mufraty_app/Core/Config/router/app_router.dart';
import 'package:mufraty_app/main.dart';

class FirebaseApi{
 final notificationSettings =  FirebaseMessaging.instance.requestPermission(provisional: true);
  Future  <void> initNotiification()async{ 
    
   final apnsToken = await FirebaseMessaging.instance.getToken();
 if (apnsToken != null) {
 print('token+$apnsToken');
 initPushNotification();
 }
  } 
void handleMessage(RemoteMessage? message ){
  if (message ==null) return;
  else{
AppRouter.routter.go(AppRouter.KNotification);
  // NavigatorKey.currentState?.pushNamed(AppRouter.KNotification);
  }
 
 }
 Future initPushNotification()async{
  FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
  FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
 }
}