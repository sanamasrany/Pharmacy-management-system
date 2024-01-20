import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy_managmentsystem/Home/home.dart';
import 'package:pharmacy_managmentsystem/shared/components/components.dart';
import 'package:pharmacy_managmentsystem/shared/components/constant.dart';

class MyOrderScreen extends StatelessWidget {
   MyOrderScreen({Key? key}) : super(key: key);
  var advancedDrawerController = AdvancedDrawerController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AdvancedDrawer(
          childDecoration: BoxDecoration(
            gradient:  LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                HexColor('A8BEE7'),
                HexColor('AEC9DE'), //gray light
                //gray dark
                HexColor('BBC5CE'),
              ],
              tileMode: TileMode.clamp,
            ),
          ),
          openRatio: 0.75,
          openScale: 0.97,
          controller: advancedDrawerController,
          backdropColor: Colors.grey[200],
          rtlOpening: false,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 500),
          drawer: Container(
            decoration:const BoxDecoration(
              // color: Colors.grey[300],
            ),
            child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only( top: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:const [
                            Text(
                              "Roaa AlSawaf",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Text("+1 987 6543 3210"),
                            SizedBox(height: 4,),
                            Text("roaaalsawaf@gmail.com"),
                          ],
                        ),
                      ),//معلومات البروفايل
                      const  SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 5,
                        width: double.infinity,
                        color: Colors.grey[350],
                      ),//الخط بين القسمين
                      const SizedBox(height: 16,),
                      Expanded(
                        child: ListView(
                          physics:const BouncingScrollPhysics(),
                          children: [
                            ListTile(
                              onTap: (){
                                navigateAndFinish(widget: HomeScreen(),context: context);
                              },
                              leading: Icon(Icons.home,
                                color:HexColor(green.toString()),),
                              title: Text("Home",style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),),

                            ),
                            ListTile(
                              onTap: (){
                                navigateAndFinish(context: context,widget: MyOrderScreen());
                              },
                              leading: Icon(Icons.local_pharmacy,
                                color:HexColor(green.toString()),),

                              title: Text("My Order",style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),),

                            ),
                            ListTile(
                              onTap: (){},
                              leading: Icon(Icons.receipt,
                                color: HexColor(green.toString()),),
                              title: Text("My Prescription",style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),),

                            ),
                            ListTile(
                              onTap: (){},
                              leading: Icon(Icons.location_on,
                                color: HexColor(green.toString()),),
                              title: Text("Saved Address",style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),),

                            ),
                            ListTile(
                              onTap: (){},
                              leading: Icon(Icons.language,
                                color: HexColor(green.toString()),),
                              title: Text("Langunge",style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),),

                            ),
                            ListTile(
                              onTap: (){},
                              leading: Icon(Icons.color_lens,
                                color: HexColor(green.toString()),),
                              title: Text("Theme",style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),),

                            ),
                            ListTile(
                              onTap: (){},
                              leading: Icon(Icons.settings,
                                color: HexColor(green.toString()),),
                              title: Text("Settings",style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),),

                            ),
                            ListTile(
                              onTap: (){},
                              leading: Icon(Icons.logout,
                                color: HexColor(green.toString()),),
                              title: Text("Logout",style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),),

                            ),

                          ],

                        ),
                      )
                    ],
                  ),
                )),
          ),
          child:Scaffold(
            appBar: AppBar(
              toolbarHeight: 80,
              titleSpacing: 0.0,
              leadingWidth: 70,
              elevation: 0.0,
              flexibleSpace: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      HexColor('A8BEE7'),
                      HexColor('AEC9DE'), //gray light
//gray dark
                      HexColor('BBC5CE'),
                    ],
                    tileMode: TileMode.clamp,
                  ),
                ),
              ),
              title: Text("My Order",style: TextStyle( color: Colors.black87)),
              leading: IconButton(onPressed: drawerControl, icon: Icon(Icons.menu,color: Colors.black87,)),
            ),
            body: Container(
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child:  ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => buildOrderItem(),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                    itemCount: 10),
              ),
            ),
          )),
    );
  }

  Widget buildOrderItem() => Stack(
    alignment: AlignmentDirectional.topEnd,
    children: [

      Container(
        height: 140,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: HexColor("E5E4E2"),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                      height: 40,
                      width: 40,
                      image: NetworkImage(
                          "https://th.bing.com/th/id/OIP.LMCLlMt28UpE5TcszardwwHaIH?w=161&h=180&c=7&r=0&o=5&dpr=1.4&pid=1.7")),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("pharmacy Name"),
                        SizedBox(
                          height: 5,
                        ),

                        Row(
                          children: [
                            Text("20 jun,11:35 am",style: TextStyle(
                              color: Colors.grey,

                            )),
                            SizedBox(
                              width: 44,
                            ),
                            Text("\$ 18.00|COD",style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.grey,
                            ))

                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          height: 40,
                          child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) => buildOrderItem1(), separatorBuilder: (context, index) => SizedBox(
                            height: 4,
                          ), itemCount: 3),
                        )
                      ],
                    ),
                  ),



                ],
              ),
            )
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color:HexColor(green.toString()),

          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            topRight: Radius.circular(16)
          ),
        ),
        height: 20,
        width: 100,
        child: Center(
          child: Text("out of Delivery",style: TextStyle(
            color: Colors.white,
            fontSize: 12
          )),
        ),

      ),
    ],

  );
  Widget buildOrderItem1() => Row(
    children: [
      Text("parmacyName"),
      SizedBox(width: 8,),
      Text("quantity",style: TextStyle(
        color: Colors.grey
      ),),
      SizedBox(width: 4,),
      Text("titer",style: TextStyle(
          color: Colors.grey
      ),),
    ],

  );

 void drawerControl() {
    advancedDrawerController.showDrawer();
  }
}
