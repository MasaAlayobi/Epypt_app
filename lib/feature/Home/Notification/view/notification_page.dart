
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
   NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
    String period = now.hour < 12 ? 'AM' : 'PM';
    String dayPeriod = period == 'AM' ? 'ص' : 'م';
    String formattedTime =
        '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
    // RemoteMessage message =ModalRoute.of(context)!.settings.arguments as RemoteMessage ;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text(
            'الإشعارات',
            // style: Styles.textStyle24,
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Container(
        color: const Color.fromARGB(136, 224, 214, 214),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title:  Text(
              ' message.notification!.title.toString()'
                // style: Styles.textStyleDate,
              ),
              subtitle: Text(
                'message.notification!.body.toString(),'
                // style: Styles.textStyleDate.copyWith(fontSize: 20),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$formattedDate – $formattedTime $dayPeriod',
                  // style: Styles.textStyleDate,
                ),
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
}

// class NotifcationViewBodyItem extends StatelessWidget {
//   const NotifcationViewBodyItem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     DateTime now = DateTime.now();
//     String formattedDate =
//         '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
//     String period = now.hour < 12 ? 'AM' : 'PM';
//     String dayPeriod = period == 'AM' ? 'ص' : 'م';
//     String formattedTime =
//         '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';

//     return Padding(
//       padding: const EdgeInsets.only(bottom: 2),
//       child: Container(
//         color: const Color.fromARGB(136, 224, 214, 214),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ListTile(
//               title: const Text(
//                 'تم استلام الطلبية',
//                 // style: Styles.textStyleDate,
//               ),
//               subtitle: Text(
//                 'اطلبهم من فاتورة بأسعار في معقول باقوى كاش باك',
//                 // style: Styles.textStyleDate.copyWith(fontSize: 20),
//               ),
//             ),
//             Align(
//               alignment: Alignment.bottomLeft,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   '$formattedDate – $formattedTime $dayPeriod',
//                   // style: Styles.textStyleDate,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
