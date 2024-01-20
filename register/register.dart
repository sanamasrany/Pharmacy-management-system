import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy_managmentsystem/Home/home.dart';
import 'package:pharmacy_managmentsystem/shared/components/components.dart';

class Register extends StatelessWidget {
   Register({Key? key}) : super(key: key);
  var firstNameController=TextEditingController();
  var lastNameController=TextEditingController();
  var phoneNumberController=TextEditingController();
  var emailController=TextEditingController();
  var ageController=TextEditingController();
  var genderController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight:80,
        titleSpacing: 4,
        leadingWidth: 58,
        elevation: 0.0,
        flexibleSpace: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient:LinearGradient(
              begin:  Alignment.topRight,
              end:Alignment.bottomLeft ,
              colors: [
                HexColor('A8BEE7'),
                HexColor('AEC9DE'),
                HexColor('BBC5CE'),
              ],
              tileMode: TileMode.clamp,

            ),
          ) ,
        ),
        leading:Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(onPressed: () {
            navigateTo(widget:HomeScreen() ,context:context);
          }, icon:Icon(Icons.arrow_back,color: Colors.black87,)),
        )
        ,
        title:Row(
          children: [
            Text("Upload Prescription",style: TextStyle(color: Colors.black87,fontSize: 18),),
          ],
        ) ,



      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient:LinearGradient(

            begin:  Alignment.topRight,
            end:Alignment.bottomLeft ,

            colors: [
              HexColor('A8BEE7'),
              HexColor('AEC9DE'),
              HexColor('BBC5CE'),
              HexColor('BDB9C7'),//
              HexColor('D3C8CC'),
              HexColor('D3CACF'),
              HexColor('DBD9DE'),
              HexColor('D7D2D8'),

            ],
            tileMode: TileMode.clamp,

          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children:[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

              ]
              )
              // Container(height: 150,width: 500 ,child: LottieBuilder.asset('images/prescription.json',)),

            ],
          ),
        ),
      ),


    );
  }
}
