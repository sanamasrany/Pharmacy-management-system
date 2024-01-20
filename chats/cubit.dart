import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_managmentsystem/Model/Chats_Model.dart';
import 'package:pharmacy_managmentsystem/chats/states.dart';
import 'package:pharmacy_managmentsystem/map/state.dart';
import 'package:pharmacy_managmentsystem/shared/network/local/cache_helper.dart';
import 'package:pharmacy_managmentsystem/shared/network/remote/dio_helper.dart';
import 'package:http/http.dart' as http;

//Pharmacy
class ChatsCubit extends Cubit<ChatsStates> {
  ChatsCubit() : super(ChatsInitialState());

  static ChatsCubit get(context) => BlocProvider.of(context);

  List<Messagee> Chatmessages =[];


  Future<List<Messagee>> getChats(String otherId ) async {

    var response = await http.get(Uri.parse("http://192.168.1.7:8000/api/messages/of/${CacheHelper.getData(key: "UserId")}/with/${otherId}"),
      headers: {
        'Accept' : 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getData(key: 'accessToken')}'
      },
    );

    print(response.statusCode);
    print(response.body);

    if(response.statusCode==200){
     // emit(GetChatsSuccessState());
      var replay = chatmodelFromJson(response.body);

      return replay.messages  ;
    }
    else{
      return [];
    }
  }

  Future<void> amethod( String otherId) async {
    emit(GetChatsLoadingState());
    Chatmessages = await ChatsCubit().getChats(otherId) ;
    emit(GetChatsSuccessState());
  }


  // Future<void> getChatmessages({
  //   required String otherId,
  //
  // }) async {
  //   emit(GetChatsLoadingState());
  //   print("GetChatsLoadingState");
  //   //print(value);
  //   print(CacheHelper.getData(key: 'accessToken'));
  //
  //   print("respons");
  //   print(otherId);
  //
  //   await  DioHelper.getData2(
  //
  //     url:"messages/of/1/with/${otherId}",
  //
  //     token:CacheHelper.getData(key: 'accessToken'),
  //
  //
  //   ).then((value){
  //     Chatmessages =  value.data['messages'] ;
  //
  //     print(Chatmessages);
  //     emit(GetChatsSuccessState());
  //
  //
  //   }).catchError((error){
  //
  //
  //     emit(GetChatsErrorState(error));
  //     print("pp ${error.toString()}");
  //
  //
  //   });
  // }



  Future<void> sendmessage({
    required String otherId,
    required String body,

  }) async {
    emit(SendChatsLoadingState());
    print("SendChatsLoadingState");
    FormData formData = FormData.fromMap({

      'body':body,

    });
    print("respons");

    await DioHelper.postData(

      url:"send/from/${CacheHelper.getData(key: "UserId")}/to/${otherId}",


      data: {
        'body':body,
      } //post=>body=>from_data
      ,
      token:CacheHelper.getData(key: 'accessToken'),

    ).then((value){
      print("succesful");


      emit(SendChatsSuccessState());
      print(value.data);
      print(value.statusCode);

      // print(value.data);
      print("SendChatsSuccessState");

    }).catchError((error){

      emit(SendChatsErrorState(error.toString()));
      print(error);


    });
  }



List<dynamic> contacts =[];

  Future<void> getcontacts() async {

    emit(contactsLoadingState());
    print("contactsLoadingState");
    //print(value);
    print(CacheHelper.getData(key: 'accessToken'));

    print("respons");


    await  DioHelper.getData2(

      url:"contacts/of/${CacheHelper.getData(key: "UserId")}",

      token:CacheHelper.getData(key: 'accessToken'),


    ).then((value){
      contacts =  value.data['contacts'];

      print(contacts);
      emit(contactsSuccessState());


    }).catchError((error){


      emit(contactsErrorState(error));
      print("pp ${error.toString()}");


    });
  }


}
