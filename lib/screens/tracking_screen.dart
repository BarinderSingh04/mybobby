import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:mybobby/models/direction_model.dart';
import 'package:mybobby/repositories/ride_repo.dart';
import 'package:mybobby/screens/home.dart';
import 'package:timelines/timelines.dart';

import '../models/location_data.dart';
import '../models/ride.dart';
import '../services/direction_service.dart';
import '../widgets/loading_dialog.dart';
import '../widgets/menu_button.dart';
import 'drawer_widget.dart';
import 'helpandsupport_screen.dart';
import 'message_screen.dart';
import 'paymentMethod_screen.dart';

class TrackingScreen extends ConsumerStatefulWidget {
  final String rideId;
  const TrackingScreen({Key? key, required this.rideId}) : super(key: key);

  @override
  ConsumerState<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends ConsumerState<TrackingScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  GoogleMapController? mapController;

  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => ref.read(trackingProvider.notifier).tracking(widget.rideId));
  }

  @override
  void dispose() {
    mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final tripState = ref.watch(trackingProvider);

    ref.listen<AsyncValue<TrackingState?>>(trackingProvider, (previous, state) {
      state.maybeMap(
        data: (data) async {
          if (data.value != null) {
            final value = data.value;
            mapController?.animateCamera(CameraUpdate.newLatLngBounds(
                value!.locationData.latLngBounds!, 100));
          }
        },
        error: (error) {
          if (error.error.toString() == "Unable to find a ride!") {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.error.toString()),
            ),
          );
        },
        orElse: () {},
      );
    });

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Material(
        child: LoadingOverlay(
          opacity: 0.8,
          color: Colors.white,
          progressIndicator: const LoadingDialog(),
          isLoading: tripState is AsyncLoading,
          child: Scaffold(
            key: _key,
            drawer: const DrawerWidget(),
            body: Stack(
              fit: StackFit.loose,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 1.4,
                  width: MediaQuery.of(context).size.width,
                  child: GoogleMap(
                    mapToolbarEnabled: true,
                    buildingsEnabled: true,
                    myLocationButtonEnabled: false,
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(30.7333, 76.7794),
                      zoom: 14,
                    ),
                    mapType: MapType.normal,
                    zoomControlsEnabled: true,
                    polylines: Set.of(
                      tripState.asData?.value?.locationData.polylines ?? [],
                    ),
                    markers: Set.of(
                      tripState.asData?.value?.locationData.markers ?? [],
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      mapController = controller;
                    },
                  ),
                ),
                Positioned(
              top: MediaQuery.of(context).viewPadding.top + 24,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MenuButton(onPressed: () {
                    _key.currentState!.openDrawer();
                  }),
                ],
              ),
            ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: size.width,
                    height: size.height * 0.4,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 36),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF000000).withOpacity(0.12),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "ESTIMATED DISTANCE",
                          style: TextStyle(
                              color: Color(0xFF010317),
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              letterSpacing: 1),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text.rich(
                          TextSpan(
                            text: tripState
                                    .valueOrNull?.locationData.totalDistance ??
                                "0",
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 28,
                                color: Color(0xFF010317)),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
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
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(
                                  tripState.when(
                                    data: (_) {
                                      return _?.locationData.startPlaceModel
                                              ?.name ??
                                          "Getting location info...";
                                    },
                                    error: (e, st) {
                                      return e.toString();
                                    },
                                    loading: () {
                                      return "Getting location info...";
                                    },
                                  ),
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
                                  color: Color(
                                    0xFF002F60,
                                  ),
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
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(
                                  tripState.when(
                                    data: (_) {
                                      return _?.locationData.endPlaceModel
                                              ?.name ??
                                          "Getting location info...";
                                    },
                                    error: (e, st) {
                                      return e.toString();
                                    },
                                    loading: () {
                                      return "Getting location info...";
                                    },
                                  ),
                                  style: const TextStyle(
                                    color: Color(0xFF212334),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (tripState.valueOrNull?.ride?.helperId != null)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // FlutterPhoneDirectCaller.callNumber('tel:+1234845313');
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(12),
                                        margin:
                                            const EdgeInsets.only(bottom: 10),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF4F5F5),
                                          border: Border.all(
                                            width: 1,
                                            color: const Color(0xFFEBEBEB),
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                            "assets/images/call.png"),
                                      ),
                                    ),
                                    const Text(
                                      "Call Driver",
                                      style: TextStyle(
                                          color: Color(0xFF212334),
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Message_Screen()));
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(12),
                                        margin:
                                            const EdgeInsets.only(bottom: 10),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF4F5F5),
                                          border: Border.all(
                                            width: 1,
                                            style: BorderStyle.solid,
                                            color: const Color(0xFFEBEBEB),
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                            "assets/images/message.png"),
                                      ),
                                    ),
                                    const Text(
                                      "Message",
                                      style: TextStyle(
                                          color: Color(0xFF212334),
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      margin: const EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                          color: const Color(0xFFF4F5F5),
                                          border: Border.all(
                                            width: 1,
                                            style: BorderStyle.solid,
                                            color: const Color(0xFFEBEBEB),
                                          ),
                                          shape: BoxShape.circle),
                                      child: Image.asset(
                                          "assets/images/share.png"),
                                    ),
                                    const Text(
                                      "Share",
                                      style: TextStyle(
                                          color: Color(0xFF212334),
                                          fontWeight: FontWeight.w400),
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
                Align(
                  alignment: Alignment.center,
                  child: Builder(builder: (context) {
                    if (tripState.valueOrNull?.ride?.helperId == null) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        height: size.height * 0.1,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.info),
                            SizedBox(width: 6.0),
                            Text(
                              "No Driver Available Yet!",
                              style: TextStyle(
                                color: Color(0xFF010317),
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return InkWell(
                      onTap: () {
                        _showBottomSheet(context, tripState.valueOrNull?.ride);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        padding: const EdgeInsets.all(16.0),
                        height: size.height * 0.1,
                        decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            Image.asset("assets/images/boypic.png"),
                            const SizedBox(width: 16.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "${tripState.valueOrNull?.ride?.helperId?.firstName} ${tripState.valueOrNull?.ride?.helperId?.lastName}",
                                  style: const TextStyle(
                                    color: Color(0xFF010317),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 4.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: const Color(0xFFEFEFEF),
                                        style: BorderStyle.solid,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "4.5",
                                        style: TextStyle(
                                          color: Color(0xFF201C1D),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Image.asset(
                                        "assets/images/yellowstargd.png",
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _showBottomSheet(context, Ride? ride) {
  showModalBottomSheet(
      enableDrag: true,
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(25),
        topLeft: Radius.circular(25),
      )),
      builder: (BuildContext context) {
        Size size = MediaQuery.of(context).size;
        return FractionallySizedBox(
          heightFactor: 0.94,
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  // color: Colors.white,
                  height: 323,
                  child: Column(
                    children: [
                      Container(
                        width: 116,
                        height: 116,
                        margin: const EdgeInsets.all(15),
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
                        child: const CircleAvatar(
                          radius: 100,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/expandboypic.png"),
                            radius: 50,
                          ),
                        ),
                      ),
                      Text(
                        "${ride?.helperId?.firstName} ${ride?.helperId?.lastName}",
                        style: const TextStyle(
                            color: Color(0xFF010317),
                            fontWeight: FontWeight.w700,
                            fontSize: 28),
                      ),
                      Container(
                        width: 60,
                        height: 24,
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: const Color(0xFFF4F5F5),
                            border: Border.all(
                              color: const Color(0xFFEFEFEF),
                              style: BorderStyle.solid,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "4.5",
                              style: TextStyle(
                                  color: Color(0xFF201C1D),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            Image.asset("assets/images/yellowstargd.png")
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        width: size.width,
                        height: size.height * 0.10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFF4F5F5),
                                      border: Border.all(
                                        width: 1,
                                        style: BorderStyle.solid,
                                        color: const Color(0xFFEBEBEB),
                                      ),
                                      shape: BoxShape.circle),
                                  child: Image.asset("assets/images/call.png"),
                                ),
                                const Text(
                                  "Call Customer",
                                  style: TextStyle(
                                      color: Color(0xFF212334),
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const Message_Screen(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    margin: const EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFF4F5F5),
                                        border: Border.all(
                                            width: 1,
                                            style: BorderStyle.solid,
                                            color: const Color(0xFFEBEBEB)),
                                        shape: BoxShape.circle),
                                    child: Image.asset(
                                        "assets/images/message.png"),
                                  ),
                                ),
                                const Text(
                                  "Message",
                                  style: TextStyle(
                                    color: Color(0xFF212334),
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFF4F5F5),
                                      border: Border.all(
                                          width: 1,
                                          style: BorderStyle.solid,
                                          color: const Color(0xFFEBEBEB)),
                                      shape: BoxShape.circle),
                                  child: Image.asset("assets/images/share.png"),
                                ),
                                const Text(
                                  "Share",
                                  style: TextStyle(
                                      color: Color(0xFF212334),
                                      fontWeight: FontWeight.w400),
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
              Container(
                height: 6,
                decoration: const BoxDecoration(color: Color(0xFFF4F5F5)),
              ),
              Container(
                width: size.width,
                height: 150,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xFF000000).withOpacity(0.12))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "TRIP",
                      style: TextStyle(
                          color: Color(0xFF010317),
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          letterSpacing: 1),
                    ),
                    SizedBox(
                      height: size.height * 0.008,
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
                              height: 12,
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
                              "${ride?.startPlace.name}",
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
                              color: Color(
                                0xFF002F60,
                              ),
                              size: 23,
                              borderWidth: 8,
                              backgroundColor: Colors.white,
                            ),
                            startConnector: SizedBox(
                              height: 12,
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
                              "${ride?.endPlace.name}",
                              style: const TextStyle(
                                color: Color(0xFF212334),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 6,
                decoration: const BoxDecoration(color: Color(0xFFF4F5F5)),
              ),
              Container(
                width: size.width,
                height: size.height * 0.22,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xFF000000).withOpacity(0.12))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "PAYMENT DETAILS",
                      style: TextStyle(
                          color: Color(0xFF010317),
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "\$43.00",
                      style: TextStyle(
                          color: Color(0xFF212334),
                          fontWeight: FontWeight.w700,
                          fontSize: 28),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Divider(
                      color: Color(0xFFEBEBEB),
                      thickness: 1,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PaymentMethod_Screen()));
                          },
                          child: const Text(
                            "Pay now",
                            style: TextStyle(
                                color: Color(0xFF002F60),
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PaymentMethod_Screen()));
                          },
                          child: Row(
                            children: [
                              Image.asset('assets/images/stripe.png'),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Color(0xFFA1A1A1),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 6,
                decoration: const BoxDecoration(color: Color(0xFFF4F5F5)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xFFFFFFFF),
                      fixedSize: Size(size.width, 56),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Color(0xFFEBEBEB),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HelpAndSupport_Screen()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/help.png"),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Need Help",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF002F60),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      });
}

final trackingProvider = StateNotifierProvider.autoDispose<TrackingNotifier,
    AsyncValue<TrackingState?>>(
  (ref) => TrackingNotifier(
    ref.watch(directionServiceProvider),
    ref.watch(rideRepositoryProvider),
  ),
);

class TrackingNotifier extends StateNotifier<AsyncValue<TrackingState?>> {
  final RideRepository _rideRepository;
  final DirectionsServices _directionsServices;
  TrackingNotifier(this._directionsServices, this._rideRepository)
      : super(const AsyncValue.data(null));

  Future<void> tracking(String rideId) async {
    try {
      List<Polyline> polylines = [];
      List<Marker> markers = [];
      state = const AsyncValue.loading();

      final ride = await _rideRepository.activeRide(rideId);
      if (ride == null) {
        state = const AsyncError(
          "Unable to find a ride!",
          StackTrace.empty,
        );
      } else {
        final directions = await getDirections(ride);

        if (ride.helperId == null) {
          markers.add(
            Marker(
              markerId: const MarkerId("user"),
              icon: await markerIcon("assets/images/user.png"),
              position: ride.startPlace.location!,
            ),
          );
        } else {
          markers.add(
            Marker(
              markerId: const MarkerId("driver"),
              icon: await markerIcon("assets/images/driver-m.png"),
              position: LatLng(
                double.tryParse(ride.helperId!.currentLat) ?? 0,
                double.tryParse(ride.helperId!.currentLong) ?? 0,
              ),
            ),
          );
        }

        if (ride.helperId == null) {
          markers.add(
            Marker(
              markerId: const MarkerId("destination"),
              icon: await markerIcon("assets/images/destination.png"),
              position: ride.endPlace.location!,
            ),
          );
        } else {
          markers.add(Marker(
            markerId: const MarkerId("destination"),
            icon: await markerIcon("assets/images/destination.png"),
            position: LatLng(
              ride.startPlace.location!.latitude,
              ride.startPlace.location!.longitude,
            ),
          ));
        }

        if (directions.polylinePoints.isNotEmpty) {
          polylines.add(
            Polyline(
              polylineId: PolylineId(
                directions.polylinePoints.length.toString(),
              ),
              width: 4,
              startCap: Cap.roundCap,
              endCap: Cap.roundCap,
              color: const Color(0xFF002F60),
              jointType: JointType.round,
              points: directions.polylinePoints
                  .map((point) => LatLng(point.latitude, point.longitude))
                  .toList(),
            ),
          );

          state = AsyncValue.data(
            TrackingState(
              ride,
              LocationData(
                polylines: polylines,
                markers: markers,
                totalDistance: directions.totalDistance,
                latLngBounds: directions.bounds,
                startPlaceModel: ride.startPlace,
                endPlaceModel: ride.endPlace,
              ),
            ),
          );
        } else {
          state = const AsyncError(
            "Unable to find a route from your coordinates!",
            StackTrace.empty,
          );
        }
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<Directions> getDirections(Ride ride) async {
    if (ride.helperId == null) {
      return _directionsServices.getRouteCoordinates(
        ride.startPlace.location!,
        ride.endPlace.location!,
      );
    } else {
      return _directionsServices.getRouteCoordinates(
        LatLng(
          double.tryParse(ride.helperId!.currentLat) ?? 0,
          double.tryParse(ride.helperId!.currentLong) ?? 0,
        ),
        ride.startPlace.location!,
      );
    }
  }

  Future<BitmapDescriptor> markerIcon(String asset) async {
    return BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(10, 10), devicePixelRatio: 3),
      asset,
    );
  }
}

class TrackingState {
  final Ride? ride;
  final LocationData locationData;

  TrackingState(this.ride, this.locationData);
}
