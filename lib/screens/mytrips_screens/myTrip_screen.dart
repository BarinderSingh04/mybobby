import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mybobby/screens/mytrips_screens/completedTrip_screen.dart';
import 'package:mybobby/screens/mytrips_screens/ongoingTrip_screen.dart';
import 'package:mybobby/widgets/circleBackButton.dart';
class MyTrip extends StatefulWidget {
  const MyTrip({Key? key}) : super(key: key);

  @override
  State<MyTrip> createState() => _MyTripState();
}

class _MyTripState extends State<MyTrip> with SingleTickerProviderStateMixin {

  late TabController _tabController;
  @override
  void initState() {
      super.initState();
      _tabController = TabController(vsync: this, length: 2);
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
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
        title: const Text("My Trips",style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: Color(0xFF010317)
        ),),
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(
              left: 24,top: 5,bottom: 5
          ),
          child: CircleBack_Button(onPressed: () {
            Navigator.pop(context);

          },),
        ),
        bottom: TabBar(controller: _tabController,
          isScrollable: true,
          // indicatorColor: Color(0xFF002F60),
          labelStyle: const TextStyle(  fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          unselectedLabelStyle: const TextStyle(  fontSize: 16,
            fontWeight: FontWeight.w400,
           ),
          labelColor:  const Color(0xFF010317),
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(
              width: 1,

              color: Color(0xFF002F60),
            ),


          ),
          tabs:
          [
            SizedBox(
              width: size.width*0.40,
              child: const Tab(child:     Text("Ongoing" ),
            ),),

      SizedBox(
              width: size.width*0.40,
              child: const Tab(
                child: Text("Completed"),
              ),
            )
          ],),
      ),
      body: TabBarView(
          controller: _tabController,
          children: [
        const OngoingTrip_Screen(),
        CompletedTrip_Screen()
      ]),
    );
  }
}
