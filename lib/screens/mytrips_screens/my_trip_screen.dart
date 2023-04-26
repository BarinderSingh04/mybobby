import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/ride.dart';
import '../../models/user_detail.dart';
import '../../repositories/ride_repo.dart';
import '../../widgets/circleBackButton.dart';
import 'trip_screen.dart';

final rideListProvider = FutureProvider.autoDispose<List<Ride>>((ref) async {
  final userId = ref.watch(userProvider)!.id!;
  return await ref.watch(rideRepositoryProvider).getRideList(userId);
});

final completedRideListProvider =
    FutureProvider.autoDispose<List<Ride>>((ref) async {
  final userId = ref.watch(userProvider)!.id!;
  return await ref.watch(rideRepositoryProvider).getCompletedRideList(userId);
});

class MyTripScreen extends ConsumerStatefulWidget {
  final bool isBack;
  const MyTripScreen(this.isBack, {Key? key}) : super(key: key);

  @override
  ConsumerState<MyTripScreen> createState() => _MyTripScreenState();
}

class _MyTripScreenState extends ConsumerState<MyTripScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        )),
        backgroundColor: const Color(0xFF002F60),
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFF002F60),
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        leadingWidth: 70,
        leading: widget.isBack
            ? Padding(
                padding: const EdgeInsets.only(left: 24, top: 5, bottom: 5),
                child: CircleBack_Button(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
            : null,
        centerTitle: true,
        title: const Text(
          "Trips",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          // indicatorColor: Color(0xFF002F60),
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          labelColor: const Color(0xFFFFFFFF),
          indicator: const UnderlineTabIndicator(
            insets: EdgeInsets.symmetric(horizontal: 12),
            borderSide: BorderSide(
              width: 2.5,
              color: Color(0xFFFAE046),
            ),
          ),
          tabs: [
            SizedBox(
              width: size.width * 0.40,
              height: 45,
              child: const Center(child: Text("Ongoing")),
            ),
            SizedBox(
              width: size.width * 0.40,
              height: 45,
              child: const Center(
                child: Text(
                  "Completed",
                ),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          TripScreen(
            ref.watch(rideListProvider),
          ),
          TripScreen(
            ref.watch(completedRideListProvider),
          ),
        ],
      ),
    );
  }
}
