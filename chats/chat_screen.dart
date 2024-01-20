

import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'package:flutter_pusher_client/flutter_pusher.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
//import 'package:laravel_echo/laravel_echo.dart';
import 'package:pharmacy_managmentsystem/Model/Chats_Model.dart';
import 'package:pharmacy_managmentsystem/chats/cubit.dart';
import 'package:pharmacy_managmentsystem/chats/states.dart';

import 'package:pharmacy_managmentsystem/shared/components/components.dart';
import 'package:pharmacy_managmentsystem/shared/components/constant.dart';
import 'package:pharmacy_managmentsystem/shared/network/local/cache_helper.dart';

//import 'package:laravel_echo/laravel_echo.dart';

class Chat_screen extends StatefulWidget{
  String otherId;
  String othername;
  Chat_screen ({
    required   this.otherId,
    required this.othername
  });

  @override
  State<Chat_screen> createState() {
    return _Chat_screen(otherId: otherId , othername: othername);
  }
}


class _Chat_screen extends State<Chat_screen> {
  String otherId;
  String othername;
  _Chat_screen ({
    required   this.otherId,
    required this.othername
  });

  final fieldText = TextEditingController();
   List<Messagee> Chatslist =[] ;



  @override
  void initState() {
    ChatsCubit.get(context).amethod(otherId);
    initeNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatsCubit, ChatsStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
           Chatslist = ChatsCubit.get(context).Chatmessages;


          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 130,
              titleSpacing: 0.0,
              leadingWidth: double.infinity,
              elevation: 0.0,
              backgroundColor: Colors.white,
              leading:

              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(onPressed: () {

                    },
                        icon: Icon(
                          Icons.arrow_back_rounded, color: Colors.black,
                          size: 25,)),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(othername,
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                                color: Colors.grey.shade800
                            ),
                          ), //
                          SizedBox(height: 10,),


                          Text("Store",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey.shade600
                            ),
                          ),

                        ],
                      ),
                    ), // location


                  ]),


            ),

            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration:
              BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/screen.jpg'), fit: BoxFit.cover),
              ),


              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(color: Colors.transparent,
                    child: Column(children: [
                      Expanded(child:
                    ConditionalBuilder(
                    condition: state is !GetChatsLoadingState ,
                      builder: (context) =>  GroupedListView<Messagee, DateTime>(
                          elements: Chatslist,
                          groupBy: (message) =>
                              DateTime(
                                  message.createdAt.year,
                                  message.createdAt.month,
                                  message.createdAt.day
                              ),
                          reverse: true,
                          order: GroupedListOrder.DESC,
                          useStickyGroupSeparators: true,
                          floatingHeader: true,
                          groupHeaderBuilder: (Messagee message) =>
                              SizedBox(
                                  height: 40,
                                  child:
                                  Center(
                                    child: Card(
                                      color: Colors.grey.shade500,
                                      child: Padding(
                                          padding: EdgeInsets.all(8),


                                          child: Text(
                                            DateFormat.yMMMd().format(
                                                message.createdAt)
                                            ,
                                            style: TextStyle(
                                                color: Colors.white
                                            ),
                                          )

                                      ),
                                    ),
                                  )

                              ),
                          padding: EdgeInsets.all(8),
                          itemBuilder: (context, Messagee message) =>
                              Align(
                                alignment: message.from == 1 ?
                                Alignment.centerRight
                                    : Alignment.centerLeft,
                                child:
                                Stack(
                                    children: [
                                      Card(
                                        color: message.from == 1 ?
                                        HexColor(green.toString())
                                            : Colors.white.withAlpha(100),
                                        elevation: 8,
                                        child: Padding(
                                          padding: EdgeInsets.all(12),
                                          child: Column(
                                            children: [
                                              Text(message.body
                                                , style: TextStyle(
                                                  color: message.from == 1?
                                                  Colors.white
                                                      : Colors.black,
                                                ),
                                              ),
                                              SizedBox(height: 10,),


                                            ],
                                          ),
                                        ),
                                      ),
                                      message.from == 1 ?
                                      Positioned(
                                        right: 6,
                                        bottom: 5,
                                        child: Text("${message.createdAt.hour}:${message.createdAt.minute}",//
                                          style: TextStyle(
                                              fontSize: 10
                                              , color:
                                          Colors.green.shade100

                                          ),
                                        ),
                                      )
                                          : Positioned(
                                        left: 6,
                                        bottom: 5,
                                        child: Text("${message.createdAt.hour}:${message.createdAt.minute}",//,
                                          style: TextStyle(
                                            fontSize: 10
                                            , color:
                                          Colors.grey.shade600,
                                          ),
                                        ),
                                      )
                                    ]
                                )
                                ,
                              )

                      ),

                      fallback: (context) =>
                      const Center(child: CircularProgressIndicator()),
                    )


                      ),


                      Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          color: Colors.white,
                          child:
                          Row(
                            children: [
                              Container(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * .85,
                                  child:
                                  TextField(
                                    controller: fieldText,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(12),
                                        hintText: 'Type your message '
                                    ),
                                    onSubmitted: (text) {

                                    },
                                  )),
                              IconButton(onPressed: () {

                                            setState(() {
                                              Chatslist.add(Messagee(id: Chatslist.length+1, from: 1, to: 2, body: fieldText.text, createdAt: DateTime.now(), updatedAt: DateTime.now()));
                                            });
                                ChatsCubit.get(context).sendmessage(otherId: otherId, body: fieldText.text);
                                clearText();
                              },
                                  icon: Icon(Icons.send,
                                    color: HexColor(green.toString()),))
                            ],
                          )

                      )


                    ],),
                  )
              ),
            ),


          );
        }

    );
  }

  void clearText() {
    fieldText.clear();
  }


  final _androidChannel = const AndroidNotificationChannel('high_importance_channel',
      'High Importance notification',
      description: 'this channel is used for important notification',
      importance: Importance.defaultImportance
  );

  final _localNotification = FlutterLocalNotificationsPlugin();




// Create echo instance
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
//             echo.channel('chat.between.${CacheHelper.getData(key: "UserId")}.${otherId}').listen('NewMessage', (message) {
//
//
//               Map<String,dynamic> msg = message;
//               String body = msg['message']['body'];
//               int from = msg['message']['from'];
//               int to = msg['message']['to'];
//
//
//               setState(() {
//                 Chatslist.add(Messagee(id: Chatslist.length+1, from: from, to: to, body: body, createdAt: DateTime.now(), updatedAt: DateTime.now()));
//               });
//
//
//
//
//
//               _localNotification.show(1,
//                 body,
//                 "  "
//                 , NotificationDetails(
//                   android: AndroidNotificationDetails(_androidChannel.id,_androidChannel.name,icon: '@drawable/pills'),
//                 ),
//
//                 payload: msg.toString(),
//               );
//
//
//
//             });
//           }
//         });
//   }


  //
  Future initlocalNot()async{
    const android = AndroidInitializationSettings('@drawable/pills');
    const settings = InitializationSettings(android: android);

    await _localNotification.initialize(
        settings,
        onSelectNotification: (payload){
          final message = payload ;

        }
    );
    final platform = _localNotification.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }



  Future<void> initeNotification()async{
   // initPusher();
    initlocalNot();
  }

}