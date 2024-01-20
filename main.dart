//import 'package:flutter_pusher_client/flutter_pusher.dart';
//import 'package:laravel_echo/laravel_echo.dart';
import 'package:pharmacy_managmentsystem/Home/cubit/cubit.dart';
import 'package:pharmacy_managmentsystem/Home/cubit/status.dart';
import 'package:pharmacy_managmentsystem/Pill_Reminder/global_bloc.dart';
import 'package:pharmacy_managmentsystem/chats/cubit.dart';
import 'package:pharmacy_managmentsystem/chats/laravel_eho_try.dart';
import 'package:pharmacy_managmentsystem/local/local.dart';
import 'package:pharmacy_managmentsystem/local/local_controller.dart';
import 'package:pharmacy_managmentsystem/map/cubit.dart';
import 'package:pharmacy_managmentsystem/map/google_map_try.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:pharmacy_managmentsystem/Categores/cough.dart';
import 'package:pharmacy_managmentsystem/Home/home.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:pharmacy_managmentsystem/Rigester_Warehouse/cubit.dart';
import 'package:pharmacy_managmentsystem/Rigester_pharmacy/cubit.dart';
import 'package:pharmacy_managmentsystem/Rigester_user/cubit.dart';
import 'package:pharmacy_managmentsystem/animation/onboarder.dart';
import 'package:pharmacy_managmentsystem/login/cubit.dart';
import 'package:pharmacy_managmentsystem/login/login_screen.dart';
import 'package:pharmacy_managmentsystem/orderWarehouse/cubit.dart';
import 'package:pharmacy_managmentsystem/pharmacyQR/cubit.dart';
import 'package:pharmacy_managmentsystem/setting/setting.dart';
import 'package:pharmacy_managmentsystem/shared/components/constant.dart';
import 'package:pharmacy_managmentsystem/shared/network/local/cache_helper.dart';
import 'package:pharmacy_managmentsystem/shared/network/remote/dio_helper.dart';
import 'package:pharmacy_managmentsystem/warehousescreens/cubit.dart';
import 'package:provider/provider.dart';
import 'register/register.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:dcdg/dcdg.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  //await laravel_echo_try().initeNotification();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  GlobalBloc?globalBloc;


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
//             echo.channel('warehouseMedicine').listen('new',
//                     (message) {
//
//                   final String msg = message.toString();
//                   print(msg);
//                 });
//           }
//         });
//   }

  @override
  void initState(){
    globalBloc=GlobalBloc();
    //initPusher();
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return
     Provider<GlobalBloc>.value(
       value: globalBloc!,
       child:
    MultiBlocProvider(
      providers: [


        BlocProvider(

          create:(context) =>PharmacyLoginCubit(),


        ),
        BlocProvider(

          create:(context) =>MapCubit(),


        ),

        BlocProvider(

          create:(context) => ChatsCubit(),


        ),
    BlocProvider(create:(context) =>PharmacyHomeCubit()..getAllPharmacyInHome()..getUser(),
    ),




    BlocProvider(

    create:(context) =>PharmacyRegisterCubit()..getDay()..getAllCity(),


    ),
    BlocProvider(

    create:(context) =>UserRegisterCubit()..getAllCity(),


    ),
    BlocProvider(

    create:(context) =>WarehouseRegisterCubit()..getAllCity(),


    ),
    BlocProvider(

    create:(context) =>OrderWarehouseCubit(),


    ),


      ],
    child: BlocConsumer<PharmacyHomeCubit,PharmacyHomeStates>(
    listener: (context, state) {

    },
    builder: (context, state) {
    MyLocalController controller= Get.put(MyLocalController());

    return GetMaterialApp(
    builder: (context, child) => ResponsiveBreakpoints.builder(

    child: child!,
    breakpoints: [
    const Breakpoint(start: 0, end: 393, name: MOBILE),
    const Breakpoint(start: 394, end: 900, name: TABLET),
    const Breakpoint(start: 901, end: 1920, name: DESKTOP),
    const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
    ],
    ),
    debugShowCheckedModeBanner: false,
    title: 'Pharmacy Management System',
    theme: ThemeData(
    colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary:HexColor(green.toString()), onPrimary:
    Colors.black87, secondary: HexColor(green.toString()),
    onSecondary:Colors.black87, error: HexColor(green.toString()),
    onError: HexColor(green.toString()), background: HexColor(green.toString()),
    onBackground: HexColor("E6E3E8"), surface: HexColor(green.toString()),
    onSurface: HexColor(green.toString())),

    timePickerTheme: TimePickerThemeData(
    backgroundColor: HexColor("E6E3E8"),
    dialHandColor: HexColor(green.toString()),
    hourMinuteColor: HexColor("E6E3E8"),
    hourMinuteTextColor:HexColor(green.toString()),
    dayPeriodColor:HexColor("E6E3E8"),
    dayPeriodTextColor:HexColor(green.toString()),

    ),

    ),
    locale:controller.intiallang,
    translations: MyLocal(),
    home: Login(),


    );
    },
          ),
    ),
     );


  }
}





