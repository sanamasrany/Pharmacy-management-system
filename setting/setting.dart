import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy_managmentsystem/Home/home.dart';
import 'package:pharmacy_managmentsystem/animation/onboarder.dart';
import 'package:pharmacy_managmentsystem/shared/components/components.dart';
import 'package:pharmacy_managmentsystem/shared/components/constant.dart';

class Setting extends StatefulWidget {
   Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();

}

class _SettingState extends State<Setting> {
  int _value=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight:80,
        titleSpacing:5,
          leadingWidth:50,
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
            navigateTo(widget:HomeScreen
              () ,context:context);
          }, icon:Icon(Icons.arrow_back_outlined,color: Colors.black87,)),
        ),

        title:Row(
          children: [
            Text("Setting",style: TextStyle(color: Colors.black87,fontSize: 20),),
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
        child:Padding(
          padding: const EdgeInsets.all(20.0),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Select language",style: TextStyle(color: Colors.grey),),
                ],

              ),
              SizedBox(height: 24,),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 19/3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color:HexColor("E5E4E2") ,


                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(

                            children: [
                              Text("English",style: TextStyle(
                                fontSize:16
                              ),),
                              Spacer(),
                              Radio(
                                activeColor: HexColor(green.toString()),
                                  value:1,
                                  groupValue:_value,
                                  onChanged:(value){
                                    setState(() {
                                      _value=value!;
                                    });
                                  })
                            ],
                          ),
                        ),
                      ),),
                    SizedBox(height: 16,),
                    AspectRatio(
                      aspectRatio: 19/3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color:HexColor("E5E4E2") ,


                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(

                            children: [
                              Text("عربي ",style: TextStyle(
                                  fontSize:16
                              ),),
                              Spacer(),
                              Radio(
                                  activeColor: HexColor(green.toString()),
                                  value:2,
                                  groupValue:_value,
                                  onChanged:(value){
                                    setState(() {
                                      _value=value!;
                                    });
                                  }),
                            ],
                          ),
                        ),
                      ),),
                  ],
                ),
              ),


            ],

          ),
        )
      ),

      bottomSheet: Container(
        height: MediaQuery.of(context).size.height*0.08,
        width: double.infinity,
        decoration: BoxDecoration(


          gradient:LinearGradient(

            begin:  Alignment.topCenter,
            end:Alignment.bottomCenter ,

            colors: [
              HexColor('56949a'),
              HexColor('3e8489'),

            ],


          ),
        ),
        child: Center(
          child: TextButton(

              onPressed:() {
               // navigateTo(context: context,widget: OnBoarding());

              },
              child:Text("Submit",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18),)),
        ),
      ),


    );
  }
}
