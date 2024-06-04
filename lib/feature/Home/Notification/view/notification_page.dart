import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mufraty_app/Core/Config/router/app_router.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/feature/Home/Notification/bloc/notification_bloc.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
     double heightSize = MediaQuery.of(context).size.height;

    double widthSize = MediaQuery.of(context).size.width;
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
      child: BlocProvider(
        create: (context) => NotificationBloc()..add(getNotification()),
        child: Builder(builder: (context) {
          return Scaffold(
     
            body: BlocBuilder<NotificationBloc, NotificationState>(
              builder: (context, state) {
               if(state is SuccessFetchNotification){
                 return ListView.builder(
                  itemCount: state.allProduct.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if(state.allProduct[index].type=='preparing-bill'){
                          GoRouter.of(context).pushReplacement(AppRouter.KHomeViewFatoraBrebaring);
                        }
                        else {
                          GoRouter.of(context).pushReplacement(AppRouter.KHomeViewFatoraNew);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Container(
                          color: const Color.fromARGB(136, 224, 214, 214),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title:
                                    Text('الموفراتي',
                                        // style: Styles.textStyleDate,
                                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),
                                        ),
                                subtitle: Text(
                                   state.allProduct[index].data.message
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
                      ),
                    );
                  },
                );
               }
               else if(state is NotFound){
 return    RefreshIndicator(
                    onRefresh: () async{
                      context.read<NotificationBloc>().add(getNotification());
                    },
                    child: ListView(
                      children: [
                          Center(
                      child: Image.asset(
                    "asstes/images/empty.png",
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 2,
                  )),
                  Center(
                    child: Text(
                      "فارغ",
                      style: TextStyle(
                          color: ColorManager().red,
                          fontSize: 33,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                      ],
                    ),
                  );
               }
               else if(state is LoadingNotification){
                 return Center(
                    child: CircularProgressIndicator(
                      color: colorApp.basicColor,
                    ),
                  );
               }
               else if (state is NoConnectionWithNotification){
                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<NotificationBloc>().add(getNotification());
                    },
                    child: ListView(
                      children: [
                       Center(
                          child: Image.asset(
                            "asstes/images/internet.png",
                            width: widthSize / 2,
                            height: heightSize / 2,
                          ),
                        ),
                        Center(
                            child: Text(
                         state.message=='Null check operator used on a null value'?
                      "لقد انقطع الاتصال بالانترنت"
                        :state.message ,
                          style: TextStyle(
                              color: ColorManager().red,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ))
                   ] )
                  );
               }
               else{
                  return RefreshIndicator(
                    onRefresh: () async{
                      context.read<NotificationBloc>().add(getNotification());
                    },
                    child: ListView(
                      children: [
                        Center(child: Text('خطأ في السيرفر')),
                      ],
                    ),
                  );
               }
              },
            ),
          );
        }),
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
