import 'package:example/util/smart_device_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState()=> _HomePageState();
}

class _HomePageState extends State<HomePage>{


  final double horizontalPadding=40;
  final double verticalPadding = 25;

  List mySmartDevices = [
    ["Smart Devices","assets/icons/air-conditioner.png",true],
    ["Smart Ac","assets/icons/air-conditioner.png",false],
    ["Smart TV","assets/icons/smart-tv.png",false],
    ["Smart Fan","assets/icons/fan.png",false],
  ];

  void powerSwitchChanged(bool value,int index){
    setState((){
      mySmartDevices[index][2]=value;
    });
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body:SafeArea(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:horizontalPadding,vertical:verticalPadding,),
              child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Icon(
                  Icons.menu,
                  size:45,
                  color:Colors.grey[800],
                ),

                Icon(
                  Icons.person,
                  size:45,
                  color: Colors.grey[800]
                ),
              ],
              ),
            ),
            const SizedBox(height :25),

          Padding(
            padding: EdgeInsets.symmetric(horizontal:horizontalPadding),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                  Text("welcome Home",
                    style: TextStyle(fontSize:20,color:Colors.grey[700]),
                  ),
                  Text(
                    "Krit simar",
                    style: GoogleFonts.biryani(
                      fontSize: 72,
                    ),
                  ),
              ],
            )
          ),
          const SizedBox(height:25),

          Padding(
            padding:EdgeInsets.symmetric(horizontal:horizontalPadding),
            child: Divider(
              color:Colors.grey[400],
              thickness:1,
            ),
          ),


          Padding(
            padding:EdgeInsets.symmetric(horizontal:horizontalPadding),
            child:Text(
              "Smart Devices",
              style:TextStyle(
                fontWeight:FontWeight.bold,
                fontSize:24,
                color:Colors.grey[800],
              ),
            ),
          ),
          Expanded(
            child:GridView.builder(
              itemCount: mySmartDevices.length,
              physics:const NeverScrollableScrollPhysics(),
              padding:const EdgeInsets.all(25),
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:2,
                childAspectRatio:1/1.3,
              ),
              itemBuilder:(context,index){
                return SmartDeviceBox(
                  smartDeviceName:mySmartDevices[index][0],
                  iconPath: mySmartDevices[index][1],
                  powerOn:mySmartDevices[index][2],
                  onChanged:(value)=> powerSwitchChanged(value,index),
                );
              }  
            )
          )
          ],
        ),
      )
    );
  }
}