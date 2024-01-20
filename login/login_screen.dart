import 'dart:async';
import 'dart:ui';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy_managmentsystem/Home/drawer.dart';
import 'package:pharmacy_managmentsystem/Home/home.dart';
import 'package:pharmacy_managmentsystem/Rigester_user/Register_User_Screen.dart';
import 'package:pharmacy_managmentsystem/Rigester_user/cubit.dart';
import 'package:pharmacy_managmentsystem/Rigester_user/states.dart';
import 'package:pharmacy_managmentsystem/animation/onboarder.dart';
import 'package:pharmacy_managmentsystem/login/cubit.dart';
import 'package:pharmacy_managmentsystem/login/states.dart';
import 'package:pharmacy_managmentsystem/shared/components/components.dart';
import 'package:pharmacy_managmentsystem/shared/components/constant.dart';
import 'package:pharmacy_managmentsystem/login/forgotPass.dart';
import 'package:pharmacy_managmentsystem/shared/network/local/cache_helper.dart';


class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();

}

class _LoginState extends State<Login> {

  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  bool isShowSignInDialog = false;





  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<PharmacyLoginCubit,PharmacyLoginStates>(

      listener: (context, state) {
        if(state is PharmacySuccessState)//نجاح او فشل التسجيل
            {

          if(state.value==200) {
            CacheHelper.saveData(
                key: 'accessToken', value: state.loginModel.accessToken).
            then((value) {
              accessToken = state.loginModel.accessToken;
            }


            );
            CacheHelper.saveData(key: 'refreshToken', value: state.loginModel.refreshToken).
            then((value){
              refreshToken=state.loginModel.refreshToken;});
            PharmacyLoginCubit.get(context).getUser();
            // PharmacyLoginCubit.get(context).getPharmacyAndWarehouse();
            Timer(Duration(
                milliseconds: 1000
            ),
                    (){
                  navigateAndFinish(context: context, widget: drawerScreen());
                }
            );

          }


        }
        if(state is PharmacyErrorState){
          if(state.error==400){
            showToast(text:"The user credentials were incorrect." ,state: ToastStates.EROOR);

          }
          if(state.error==422){
            showToast(text:"The password  or email field is required." ,state: ToastStates.EROOR);

          }

        }

        if(state is UserSuccessLoginWithGoogleState){
          if(state.value==200) {

            CacheHelper.saveData(
                key: 'accessToken', value: state.loginModel.accessToken).
            then((value) {
              accessToken = state.loginModel.accessToken;
            }


            );
            CacheHelper.saveData(key: 'refreshToken', value: state.loginModel.refreshToken).
            then((value){
              refreshToken=state.loginModel.refreshToken;});



            CacheHelper.saveData(
                key: 'Googlebool', value: "true").
            then((value) {
              Googlebool = true;
            });
            print("its me hii : ${accessTokenGoogle}");
            print(Googlebool);

            PharmacyLoginCubit.get(context).getUser();
            // PharmacyLoginCubit.get(context).getPharmacyAndWarehouse();
            Timer(Duration(
                milliseconds: 1000
            ),
                    () {
                  navigateAndFinish(context: context, widget: drawerScreen());
                });
          }

        }

        if(state is UserErrorLoginWithGoogleState){
          if(state.error==400){
            showToast(text:"Google account unauthorized." ,state: ToastStates.EROOR);

          }


        }

      },

      builder: (context, state) {
        return Scaffold(

          body:Container(
            height:MediaQuery.of(context).size.height ,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  HexColor('A8BEE7'),
                  HexColor('AEC9DE'), //gray light
                  //gray dark
                  HexColor('BBC5CE'),
                  HexColor('BDB9C7'), //
                  HexColor('D3C8CC'),
                  HexColor('D3CACF'),
                  HexColor('DBD9DE'),
                  HexColor('D7D2D8'),
                ],
                tileMode: TileMode.clamp,
              ),
            ),
            child:SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 180),


                child: Column(


                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text("12".tr,style: TextStyle(fontSize: 45,color:HexColor(green.toString()), ),),
                    const  SizedBox(height: 20),

                    Text("13".tr
                      ,style: TextStyle(
                        color: Colors.black38,
                      ),),
                    const  SizedBox(height: 34),

                    defaultTextFieldPharmacy(
                        controller:emailController,
                        type: TextInputType.emailAddress,
                        hint: "14".tr,
                        validate:(value){
                          if(value.isEmpty)
                          {
                            return "Your email must not be empty";
                          }
                          else{
                            return null;
                          }
                        },
                        prefix:Icons.email_outlined),
                    const SizedBox(height: 20,),
                    defaultTextFieldPharmacy(
                      controller: passwordController,
                      type: TextInputType.number,
                      hint: "15".tr,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return "Your password must not be empty";
                        }
                        return null;
                      },
                      prefix:Icons.lock_outline,
                      suffixPressed:() {

                        PharmacyLoginCubit.get(context).changePasswordVisibility();
                      },
                      suffix: PharmacyLoginCubit.get(context).suffix,
                      isPassword: PharmacyLoginCubit.get(context).isPasswordShown,

                    ),

                    const  SizedBox(height:5,),
                    defaultTextButton(
                        color: HexColor(green.toString()),

                        function:(){

                          navigateTo(context: context,widget:ForgotPasswordScreen());
                        }, text:"16".tr),
                    SizedBox(height: 30,),
                    ConditionalBuilder(
                      condition: state is !PharmacyLoadingState ,
                      builder: (context) =>  newDefaultButton(

                          background: HexColor(green),
                          text: "17".tr,
                          //  background: HexColor(green.toString()),
                          function: (){
                            print(emailController.text );
                            print(passwordController.text );
                            PharmacyLoginCubit.get(context).login(email: emailController.text,
                                password: passwordController.text);
                          },

                          width: double.infinity,
                          isAppbar: false
                      ),
                      fallback: (context) =>
                      const Center(child: CircularProgressIndicator()),
                    ),
                    const  SizedBox(height:10,),

                    Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children:  [
                        Text("18".tr,style:TextStyle(
                          color: Colors.black38,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,

                        ),),
                        BlocConsumer<UserRegisterCubit,UserRegisterStates>(
                          listener: (context, state) {

                          },
                          builder: (context, state) {
                            return defaultTextButton(
                                color: HexColor(green.toString()),

                                function:(){
                                  UserRegisterCubit.get(context).getAllCity();
                                  print( UserRegisterCubit.get(context).allCity);
                                  navigateTo(context: context,widget:RegisterUserScreen());
                                }, text: "19".tr);
                          },
                        ),



                      ],
                    ),
                    const  SizedBox(height:5,),

                    Row(
                      children:  [
                        Expanded(
                          child: Divider(),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "20".tr,
                            style: TextStyle(
                                color: Colors.black38,
                                fontWeight: FontWeight.w500,
                                fontSize: 12
                            ),
                          ),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(height:20,),


                    Container(
                      height: 47,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white10.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(35),

                      ),

                 child :     ConditionalBuilder(
                        condition: state is !UserLoadingLoginWithGoogleState ,
                        builder: (context) =>  TextButton(

                          onPressed:() {
                            _googleLogin();

                          },
                          child:Image.asset("images/search.png",height: 24,width: 24),

                        ),
                        fallback: (context) =>
                        const Center(child: CircularProgressIndicator()),
                      ),


                    ),


                  ],
                ),
              ),
            ),
          ),

        );
      },
    );


  }


  Future _googleLogin()async {



    final user= await Signingoogle.login();



    if (user !=null){

      GoogleSignInAuthentication googleSignInAuthentication = await user.authentication;
      String? acc= googleSignInAuthentication.accessToken;

      print("User Access Token: ${googleSignInAuthentication.accessToken}");

      print(user.toString());
     PharmacyLoginCubit.get(context).loginwithgoogle(google_access_token: googleSignInAuthentication.accessToken!);



    // Navigator.of(context).pushReplacement( MaterialPageRoute(builder:(context) => Logininfo(user: user , acc: '${acc}',) ));
    }


  }


}
class Signingoogle {

   static final _webid =  '964508965924-khcq3vigp0ig3is5g1gcvqia57ct1rti.apps.googleusercontent.com';
  static final _googlesignin = GoogleSignIn(serverClientId : _webid);
  //static final _googlesignin = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() => _googlesignin.signIn();


  static Future logout() => _googlesignin.disconnect();
}



class Logininfo extends StatelessWidget {
  final GoogleSignInAccount user;
  final String? acc;
  Logininfo({
    required this.user,
    required this.acc
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
           child:
           Text(
               user.displayName!
           )

          ),
          SizedBox(height: 20,),
          Center(
    child:   Text(
              user.email
          )),
          SizedBox(height: 20,),
          Center(
              child:   Text(
                  user.id
              )),
           SizedBox(height: 20,),
           Center(
               child:   Text(
                   acc!
              )),
          //SizedBox(height: 20,),
          // Center(
          //     child:   Text(
          //         user.authentication.toString()
          //     )),
           SizedBox(height: 20,),
          Center(
              child:
          ElevatedButton(
            child: Text(
              "Logout"
            ),
            onPressed: (){
              _googleLogout(context);
            },
          )
          ),
        ],
      ),
    );
  }
  Future _googleLogout(context)async {
    await  Signingoogle.logout();
    Navigator.of(context).pushReplacement( MaterialPageRoute(builder:(context) =>Login()  ));
  }

}
