//
//
// import 'dart:async';
// import 'dart:convert';
//
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_pusher_client/flutter_pusher.dart';
// import 'package:flutter_pusher_client/flutter_pusher.dart';
// import 'package:flutter_pusher_client/flutter_pusher.dart';
// import 'package:flutter_pusher_client/flutter_pusher.dart';
// import 'package:get/get.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:pharmacy_managmentsystem/Model/notification_model.dart';
// import 'package:pharmacy_managmentsystem/shared/components/components.dart';
// import 'package:pharmacy_managmentsystem/shared/components/constant.dart';
// import 'package:laravel_echo/laravel_echo.dart';
// import 'package:pharmacy_managmentsystem/shared/network/local/cache_helper.dart';
//
//
//
// class laravel_echo_try {
//
//   final _androidChannel = const AndroidNotificationChannel('high_importance_channel',
//       'High Importance notification',
//   description: 'this channel is used for important notification',
//     importance: Importance.defaultImportance
//   );
//
//   final _localNotification = FlutterLocalNotificationsPlugin();
//
//
//
//
// // Create echo instance
//   Future<void> initPusher() async {
//     final PusherOptions options = PusherOptions(
//         auth: PusherAuth(
//           'https://com.nhancv.live/api/broadcasting/auth',
//         ),
//         encrypted: true,
//         cluster: 'ap2');
//     FlutterPusher? pusher;
//     pusher = FlutterPusher('771726de6f4e41c926c5', options, enableLogging: true,
//         onConnectionStateChange: (ConnectionStateChange state) async {
//           print('stateChange ${state.toJson()}');
//           if (pusher != null && state.currentState == 'CONNECTED') {
//             final String socketId = pusher.getSocketId();
//             print('pusher socket id: $socketId');
// // Laravel echo will subscribe the channel with full namespace.
//             // Ex: App\Events
//             final Echo echo = Echo(<String, dynamic>{
//               'broadcaster': 'pusher',
//               'client': pusher,
//             });
//             echo.channel('warehouseMedicine').listen('NewWarehouseMedicine', (message) {
//
//
//               Map<String,dynamic> msg = message;
//               String name = msg['warehouseName'];
//               String mednam = msg['medicineName'];
//               print(name);
//               print(mednam);
//
//
//
//   _localNotification.show(1,
//     name,
//     "$mednam يفوفر لدينا : "
//     , NotificationDetails(
//       android: AndroidNotificationDetails(_androidChannel.id,_androidChannel.name,icon: '@drawable/pills'),
//     ),
//
//     payload: msg.toString(),
//   );
//
//
//
//                 });
//           }
//         });
//   }
//
//
//   //
//   Future initlocalNot()async{
//     const android = AndroidInitializationSettings('@drawable/pills');
//     const settings = InitializationSettings(android: android);
//
//     await _localNotification.initialize(
//       settings,
//         onSelectNotification: (payload){
//         final message = payload ;
//
//     }
//     );
//     final platform = _localNotification.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
//   await platform?.createNotificationChannel(_androidChannel);
//   }
//
//
//
//   Future<void> initeNotification()async{
//     initPusher();
//     initlocalNot();
//   }
//
//
//
//
//
//
//
// }
