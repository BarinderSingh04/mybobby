import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
class CompletedTrip_Screen extends StatelessWidget {
   CompletedTrip_Screen({Key? key}) : super(key: key);
List<String> dateList=[
  "23 NOV 2022, 3:15AM",
  "15 NOV 2022, 9:15PM",
];
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return  Scaffold(
      body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 12),
          child:ListView.separated(
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [



                    Text(dateList[index],style: TextStyle(
                      fontWeight:FontWeight.w600,
                      color: const Color(0xFF010317,).withOpacity(0.4),
                    ),),
                    SizedBox(height: size.height*0.02,),
                    Container(
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

                  ],
                );
              },
              padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: size.height*0.03,
                );
              },
              itemCount: dateList.length)
      ),
    );
  }
}
