import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/circleBackButton.dart';
class Message_Screen extends StatelessWidget {
  const Message_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
       appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          // leadingWidth: 50,

          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
              statusBarColor: Colors.white
          ),
          title: const Text("Guy Hawkins",style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Color(0xFF010317)
          ),),
          leading: Padding(
            padding: const EdgeInsets.only(
                left: 14
            ),
            child: CircleBack_Button(onPressed: () {
              Navigator.pop(context);
            },),
          ),
         actions: [
           Padding(
             padding: const EdgeInsets.only(right: 14),
             child: Container(
               margin: const EdgeInsets.all(5),
               padding: const EdgeInsets.all(3),
               decoration: const BoxDecoration(
                 shape: BoxShape.circle,
                 gradient: LinearGradient(
                   begin: Alignment.bottomCenter,
                   end: Alignment.topLeft,
                   colors: [

                     Color(0xFF002F60),
                     Color(0xFF8E924B),
                     Color(0xFFEAD23E)

                   ],
                 ),
               ),
               child: CircleAvatar(
                 radius: 20,
                 backgroundColor: Colors.white,
                 child: CircleAvatar(
                     backgroundColor: Colors.white,
                     radius: 18,

                     child: Image.asset("assets/images/boypic.png",fit: BoxFit.fill,)),
               ),
             ),
           ),
         ],
       ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              // reverse: true,
              padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 24),
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: const CircleAvatar(
                          radius: 18  ,
                          backgroundImage:AssetImage("assets/images/boypic.png",),),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE2F0FF),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: const Text("In Which company btw?",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF010317)
                      ),),
                    )
                  ],
                )  ,
                const SizedBox(height: 16,),
                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4F5F5),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: const Text("Hi, Hawkins! How’s your day going",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF010317)
                      ),),
                    )
                  ],
                ),
                const SizedBox(height: 16,),
                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4F5F5),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: const Text("Cool! Let’s meet at 16:00 near \nthe shopping mall!",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF010317)
                      ),),
                    )
                  ],
                ),
                const SizedBox(height: 16,),
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: const CircleAvatar(
                        radius: 18  ,
                        backgroundImage:AssetImage("assets/images/boypic.png",),),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                      decoration: BoxDecoration(
                          color: const Color(0xFFE2F0FF),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: const Text("Congrats! After all this \nsearches you finally made \nit",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF010317)
                        ),),
                    )
                  ],
                )  ,
                const SizedBox(height: 16,),
                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                      decoration: BoxDecoration(
                          color: const Color(0xFFF4F5F5),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: const Text("Hi, Hawkins! How’s your day going",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF010317)
                        ),),
                    )
                  ],
                ),
                const SizedBox(height: 16,),
                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                      decoration: BoxDecoration(
                          color: const Color(0xFFF4F5F5),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: const Text("Cool! Let’s meet at 16:00 near \nthe shopping mall!",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF010317)
                        ),),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 30,),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: size.width*0.7,
                  height: 56,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFFEBEBEB),
                      style: BorderStyle.solid
                    ),
                    color: const Color(0xFFF4F5F5),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: TextFormField(
                    
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Type here....",
                      contentPadding: EdgeInsets.all(8)
                    ),
                  ),
                ),
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFF002F60),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Image.asset("assets/images/send.png"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
