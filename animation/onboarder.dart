import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rive/rive.dart';
import 'package:pharmacy_managmentsystem/Rigester_Warehouse/Register_WarehouseScreen.dart';
import 'package:pharmacy_managmentsystem/Rigester_pharmacy/Register_Pharmacy_Screen.dart';
import 'package:pharmacy_managmentsystem/Rigester_user/Register_User_Screen.dart';
import 'package:pharmacy_managmentsystem/shared/components/components.dart';
import 'package:pharmacy_managmentsystem/shared/components/constant.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);


  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late RiveAnimationController _riveAnimationControllerUser;
  late RiveAnimationController _riveAnimationControllerWarehouse;
  late RiveAnimationController _riveAnimationControllerPharmacy;
  @override
  void initState(){
    _riveAnimationControllerUser=OneShotAnimation("active",autoplay: false);
    _riveAnimationControllerWarehouse=OneShotAnimation("active",autoplay: false);
    _riveAnimationControllerPharmacy=OneShotAnimation("active",autoplay: false);


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: background(
        child: Stack(
          children: [
            Positioned(
                width: MediaQuery.of(context).size.width*1.7,
                bottom: 130,

                child: Image.asset("images/")),
            Positioned.fill(child:
            BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 20,
                  sigmaY: 10
              ),
              //child: SizedBox(),
            ),

            ),
            const RiveAnimation.asset("images/sshapes_greenblack.riv"),
            Positioned.fill(child:
            BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 30,
                  sigmaY: 30
              ),
              child: const SizedBox(),
            ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24,vertical:40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 260,
                      child: Column(
                        children:  [
                          Text(
                            "Welcome to our pharmacy app"
                            ,
                            style: TextStyle(
                                fontSize:40,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Poppins",
                                height: 1.2,
                                color: HexColor(green.toString())

                            ),
                          ),
                          const  SizedBox(height: 16),
                          const Text(
                            "welcome as a warehouse manager for pharmaceuticals"
                                ",we look forward to working with you to provide the best products to our customers",
                            style: TextStyle(color: Colors.black38),
                          ),
                          const Text(""),
                          const Text(
                            "welcome as pharmacist,we value your experience and"
                                " knowledgewe look forward to working with you to provide the best services"
                                " to our customers",
                            style: TextStyle(color: Colors.black38),
                          ),
                          const  Text(""),
                          const  Text(
                            "welcome you as a user ,We hope that our pharmacy app will be the "
                                "perfect place to meet all your needs",
                            style: TextStyle(color: Colors.black38),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),

                    GestureDetector(
                      onTap:() {
                        _riveAnimationControllerUser.isActive=true;
                        //   navigateTo(widget: RegisterScreen(),context: context);
                        Future.delayed(
                            const Duration(milliseconds: 900),
                                (){
                              navigateTo(widget:RegisterUserScreen(),context: context);
                            }
                        );


                      },
                      child: SizedBox(
                          height: 64,
                          width: 200,
                          child: Stack(
                            children: [
                              RiveAnimation.asset(
                                "images/button_greenblack.riv",
                                controllers: [_riveAnimationControllerUser],
                              ),
                              Positioned.fill(
                                  top: 8,
                                  child:
                                  Row(
                                    mainAxisAlignment:MainAxisAlignment.center,
                                    children:[
                                      Icon(Icons.arrow_forward, color: HexColor(green.toString())),
                                      const SizedBox(width: 8,),
                                      Text("User           ",style:TextStyle(fontWeight:FontWeight.w600, color: HexColor(green.toString())),

                                      ),
                                    ],
                                  ))
                            ],
                          )),
                    ),
                    const SizedBox(height: 4,),
                    GestureDetector(
                      onTap:() {
                        _riveAnimationControllerWarehouse.isActive=true;
                        Future.delayed(
                            const Duration(milliseconds: 900),
                                (){
                              navigateTo(widget:RegisterWarehouseScreen() ,context: context);
                            }
                        );

                      },
                      child: SizedBox(
                          height: 64,
                          width: 200,
                          child: Stack(
                            children: [
                              RiveAnimation.asset(
                                "images/button_greenblack.riv",
                                controllers: [_riveAnimationControllerWarehouse],
                              ),
                              Positioned.fill(
                                  top: 8,
                                  child:
                                  Row(
                                    mainAxisAlignment:MainAxisAlignment.center,
                                    children:[
                                      Icon(Icons.arrow_forward, color: HexColor(green.toString())),
                                      const SizedBox(width: 8,),
                                      Text("Warehouse",style:TextStyle(fontWeight:FontWeight.w600, color: HexColor(green.toString())),

                                      ),
                                    ],
                                  ))
                            ],
                          )),
                    ),
                    const  SizedBox(height: 4,),
                    GestureDetector(
                      onTap:() {
                        _riveAnimationControllerPharmacy.isActive=true;
                        Future.delayed(
                            const Duration(milliseconds: 900),
                                (){
                              navigateTo(widget:RegisterPharmacyScreen() ,context: context);
                            }
                        );

                      },
                      child: SizedBox(
                          height: 64,
                          width: 200,
                          child: Stack(
                            children: [
                              RiveAnimation.asset(
                                "images/button_greenblack.riv",
                                controllers: [_riveAnimationControllerPharmacy],
                              ),
                              Positioned.fill(
                                  top: 8,
                                  child:
                                  Row(
                                    mainAxisAlignment:MainAxisAlignment.center,
                                    children:[
                                      Icon(Icons.arrow_forward, color: HexColor(green.toString())),
                                      const  SizedBox(width: 8,),
                                      Text("Pharmacy",style:TextStyle(fontWeight:FontWeight.w600, color: HexColor(green.toString())),

                                      ),
                                    ],
                                  ))
                            ],
                          )),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
