import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timelines/timelines.dart';

import '../../models/ride.dart';
import '../confirm_trip_screen.dart';

class TripScreen extends StatelessWidget {
  final AsyncValue<List<Ride>> rideListState;
  const TripScreen(
    this.rideListState, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: rideListState.when(
          data: (data) {
            if (data.isEmpty) {
              return const Center(
                child: Text(
                  "No rides available right now!",
                  style: TextStyle(
                    color: Color(0xFF212334),
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(24),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final ride = data[index];
                return BookingCard(ride);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 15,
                );
              },
              itemCount: data.length,
            );
          },
          error: (e, st) {
            return Center(
              child: Text(e.toString()),
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Widget trackingButtonShow(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          fixedSize: const Size.fromHeight(45),
          backgroundColor: const Color(0xFF002F60),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Color(0xFFEBEBEB),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {},
        child: Text(
          "Tracking",
          style: GoogleFonts.inter(
              fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
    );
  }
}

class BookingCard extends ConsumerWidget {
  final Ride ride;
  const BookingCard(this.ride, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => ConfirmTripScreen(ride),
        //   ),
        // );
      },
      child: Stack(
        fit: StackFit.loose,
        children: [
          Column(
            children: [
              const SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F5F5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${ride.customer?.firstName} ${ride.customer?.lastName}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF010317),
                          ),
                        ),
                        Text(
                          DateFormat('dd MMM yyyy, hh:mm aa')
                              .format(ride.createdAt),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF010317).withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    FixedTimeline(
                      direction: Axis.vertical,
                      children: [
                        TimelineTile(
                          nodeAlign: TimelineNodeAlign.start,
                          node: const TimelineNode(
                            indicator: OutlinedDotIndicator(
                              color: Color(
                                0xFFFAE046,
                              ),
                              size: 23,
                              borderWidth: 8,
                              backgroundColor: Colors.white,
                            ),
                            endConnector: SizedBox(
                              height: 15,
                              child: DecoratedLineConnector(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFFf8f2c9),
                                      Color(0xFFefe49f),
                                      Color(0xFFEAD23E),
                                      Color(0xFFbfc3a6),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          contents: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              ride.startPlace.name,
                              style: const TextStyle(
                                color: Color(0xFF212334),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        TimelineTile(
                          nodeAlign: TimelineNodeAlign.start,
                          node: const TimelineNode(
                            indicator: OutlinedDotIndicator(
                              color: Color(0xFF002F60),
                              size: 23,
                              borderWidth: 8,
                              backgroundColor: Colors.white,
                            ),
                            startConnector: SizedBox(
                              height: 15,
                              child: DecoratedLineConnector(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFFbfc3a6),
                                      Color(0xFF889daf),
                                      Color(0xFF002F60),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          contents: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              ride.endPlace.name,
                              style: const TextStyle(
                                color: Color(0xFF212334),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (ride.status == RideStatus.completed)
            Positioned(
              right: 6,
              top: 35,
              child: Container(
                height: 20,
                width: 20,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/greentick.png"),
                  ),
                ),
              ),
            ),
          Positioned(
            left: 20,
            child: Container(
              width: 48,
              height: 48,
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white),
              ),
              child: CircleAvatar(
                child: Image.asset('assets/images/profilepic.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
