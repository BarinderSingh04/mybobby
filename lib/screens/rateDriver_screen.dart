

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class RateDriver_Screen extends StatelessWidget {
  const RateDriver_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rate Driver"),
        backgroundColor: const Color(0xFF002F60),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            _showRatingDialog(context);
          },
          child: const Text("Show Dialoge"),
        )
      ),
    );
  }
  void _showRatingDialog(context) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(

            insetPadding: EdgeInsets.zero,
            contentPadding: const EdgeInsets.symmetric(vertical: 24,horizontal: 14),
            clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: const Color(0xFF000000).withOpacity(0.12),
                    width: 1,
                    style: BorderStyle.solid
                  ),
                  borderRadius: BorderRadius.circular(24)),


            content: Builder(
              builder: (context) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width*0.75,
                  height: MediaQuery.of(context).size.height*0.48,
                  child: Column(children: [
                    Image.asset("assets/images/greencircle.png"),
                    SizedBox(height: MediaQuery.of(context).size.height*0.024),
                    const Text("Trip Completed!", style: TextStyle(
                      color: Color(0xFF010317),
                      fontSize: 28,
                      fontWeight: FontWeight.w700
                    ),),
                    SizedBox(height: MediaQuery.of(context).size.height*0.020),
                    const Divider(
                      color: Color(0xFFEBEBEB),
                    thickness: 1,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.029),
                  Row(
                                      children: [

                        Container(
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
                      const Text("How was your experience \n"
                          "with Guy Hawkins ", style: TextStyle(
                          color: Color(0xFF010317),
                          fontSize: 16,
                          fontWeight: FontWeight.w700
                      ),),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.03),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height*0.05,
                    //   child: ListView.separated(
                    //     shrinkWrap: true,
                    //        padding: EdgeInsets.symmetric(horizontal: 4),
                    //        scrollDirection: Axis.horizontal,
                    //       itemBuilder: (context, index) {
                    //         return Image.asset("assets/images/whitestar.png");
                    //       }, separatorBuilder: (context, index) {
                    //         return SizedBox(width: MediaQuery.of(context).size.width*0.02);
                    //       }, itemCount: 5),
                    // ),
                    RatingBar.builder(
                      initialRating: 0,
                      minRating: 0,
                      direction: Axis.horizontal,
                      glow: false,
                      unratedColor: const Color(0xFFDFDFDF),

                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.02),

                    TextButton(onPressed: (){Navigator.pop(context);}, child: const Text("Skip",style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF010317)
                    ),))
                  ],),
                );
              }
            ),
          );
        });
  }
}
