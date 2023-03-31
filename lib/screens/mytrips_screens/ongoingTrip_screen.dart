

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybobby/screens/paymentMethod_screen.dart';
import 'package:mybobby/screens/tracking_screen.dart';
import 'package:timelines/timelines.dart';
class OngoingTrip_Screen extends StatelessWidget {
  const OngoingTrip_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Scaffold(
     body: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 12),
       child:ListView.separated(
           itemBuilder: (context, index) {
             return Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [



                 Text("TODAY, 4:23PM",style: TextStyle(
                   fontWeight:FontWeight.w600,
                   color: const Color(0xFF010317,).withOpacity(0.4),
                 ),),
                 SizedBox(height: size.height*0.02,),
                 GestureDetector(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>const Tracking_Screen()));
                   },
                   child: Container(
                     width:size.width*0.9 ,
                     height: size.height*0.22,
                     padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 4),
                     decoration: const BoxDecoration(
                       image: DecorationImage(
                         image: AssetImage("assets/images/Card.png",
                         ),fit: BoxFit.fill
                       )
                     ),
                      child: FixedTimeline(
                        direction:Axis.vertical ,
                        mainAxisSize: MainAxisSize.max,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        children: [
                          TimelineTile(
                            nodeAlign: TimelineNodeAlign.start,
                            node: const TimelineNode(
                              indicator: OutlinedDotIndicator(
                                color: Color(0xFFFAE046,),
                                size: 28,
                                borderWidth: 8,
                                backgroundColor: Colors.white,
                              ),
                              endConnector: SizedBox(
                                height: 40,
                                child: DecoratedLineConnector(

                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xFFEAD23E),
                                        Color(0xFF002F60),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            contents: Row(
                              children: [
                                const Spacer(),
                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text("Start",style: TextStyle(
                                      color: Color(0xFF010317),
                                      fontWeight: FontWeight.w400,
                                    ),),
                                    Text("3517 W. Gray St. Utica, Pennsylvani...",style: TextStyle(
                                      color: Color(0xFF212334),
                                      fontWeight: FontWeight.w700,
                                    ),),
                                  ],
                                ),
                              ],
                            ),
                          ),


                          TimelineTile(
                            nodeAlign: TimelineNodeAlign.start,
                            node: const TimelineNode(
                              indicator: OutlinedDotIndicator(
                                color: Color(0xFF002F60,),
                                size: 28,
                                borderWidth: 8,
                                backgroundColor: Colors.white,
                              ),
                              // startConnector:  SizedBox(
                              //   height: 20,
                              //   child: DecoratedLineConnector(
                              //
                              //     decoration: BoxDecoration(
                              //       gradient: LinearGradient(
                              //         begin: Alignment.topLeft,
                              //         end: Alignment.bottomRight,
                              //         colors: [
                              //           Color(0xFFEAD23E),
                              //           Color(0xFF002F60),
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ),
                            contents: Row(
                              children: [
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        Text("Destination",style: TextStyle(
                                          color: Color(0xFF010317),
                                          fontWeight: FontWeight.w400,
                                        ),),
                                        Text("8502 Preston Rd. Inglewood, Maine...",style: TextStyle(
                                          color: Color(0xFF212334),
                                          fontWeight: FontWeight.w700,
                                        ),),
                                      ],
                                    )

                                  ],
                                ),
                              ],
                            ),
                          ),





                        ],
                      ),
                   ),
                 ),
                 SizedBox(height: size.height*0.02,),
             ElevatedButton(
             style: ElevatedButton.styleFrom(
             elevation: 0,

             backgroundColor:const Color(0xFF002F60),
             fixedSize: Size(size.width, 56),
             shape:
             RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
             onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>const PaymentMethod_Screen()));

             },
             child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
             Text("Pay now(\$500.00)",
             style:GoogleFonts.inter(
             fontSize: 14,
             color: const Color(0xFFFFFFFF),
             fontWeight: FontWeight.w700
             ),
             ),
                 Row(
                   children: [
                     Image.asset('assets/images/stripe.png'),
                     const Icon(Icons.arrow_forward_ios_rounded,color: Color(0xFFA1A1A1),)
                   ],
                 )
               ],
             )),

               ],
             );
           },
           padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
           separatorBuilder: (context, index) {
             return const SizedBox();
           },
           itemCount: 1)
     ),
    );
  }
}
