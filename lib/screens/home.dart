import 'dart:async';
import 'package:flutter/material.dart' hide MenuBar;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as lac;
import 'package:mybobby/commonClass/commonColors.dart';
import 'package:mybobby/models/user.dart';
import 'package:mybobby/screens/mytrips_screens/search_places_screen.dart';
import 'package:mybobby/screens/search_screen.dart';
import 'package:mybobby/widgets/menuButton.dart';

import '../models/location_model.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  final _controller = TextEditingController();

  List<String> imageList = [
    "assets/images/homeicon.png",
    "assets/images/office.png",
    "assets/images/saved.png",
  ];

  List<String> titleList = [
    "Home",
    "Office",
    "Saved",
  ];

  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();
  final Set<Marker> _markers = {};
  int selectedIndex = -1;
  lac.LocationData? locationData;
  List<Placemark>? address;
  lac.Location location = lac.Location();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await getLocationData();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        key: _key,
        drawer: const Drawer(),
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 1.3,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                mapToolbarEnabled: true,
                buildingsEnabled: true,
                myLocationButtonEnabled: false,
                zoomGesturesEnabled: true,
                initialCameraPosition: const CameraPosition(
                  target: LatLng(30.7333, 76.7794),
                  zoom: 14,
                ),
                mapType: MapType.normal,
                zoomControlsEnabled: true,
                markers: _markers,
                onMapCreated: (GoogleMapController controller) {
                  mapController.complete(controller);
                },
              ),
            ),
            /*   Container(
              width: size.width,
              height: size.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/map.png"),
                      fit: BoxFit.fill)),
            ),*/
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
                width: size.width,
                height: size.height * 0.44,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${user?.firstName} ${user?.lastName}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: darkBlueColor),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    const Text(
                      "Let's start your ride!",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 28,
                          color: darkBlueColor),
                    ),
                    SizedBox(
                      height: size.height * 0.034,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/bluearrow.png"),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Text(
                          address != null
                              ? "${address![0].name},"
                                  " ${address![0].subAdministrativeArea},"
                                  " ${address![0].locality}, "
                                  "${address![0].country}"
                                  " "
                                  "${address![0].postalCode}"
                              : "3517 W. Gray St. Utica, Pennsylvania 57867",
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: darkBlueColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.024,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 6),
                        width: size.width,
                        height: size.height * 0.08,
                        decoration: BoxDecoration(
                            color: whiteColor,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                spreadRadius: 2,
                                color: blackColor.withOpacity(0.08),
                                // blurStyle: BlurStyle.outer,
                                // color: Colors.red,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            border: Border.all(
                                color: lightGreyColor,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 17,
                            ),
                            Center(
                                child: Image.asset(
                                    "assets/images/searchicon.png")),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Center(
                                child: TextFormField(
                                  enabled: true,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SearchScreen(),
                                      ),
                                    );
                                  },
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Search Destination",
                                      hintStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: grayColor,
                                      )),
                                ),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: size.height * 0.028,
                    ),
                    SizedBox(
                      height: 70,
                      child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                width: size.width * 0.26,
                                decoration: BoxDecoration(
                                  color: selectedIndex == index
                                      ? lightWhiteColor
                                      : whiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                      color: blackColor.withOpacity(0.08),
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                  border: selectedIndex == index
                                      ? Border.all(
                                          color: lightWhiteColor,
                                          width: 1,
                                          style: BorderStyle.solid,
                                        )
                                      : Border.all(
                                          color: lightGreyColor,
                                          width: 1,
                                          style: BorderStyle.solid,
                                        ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: Image.asset(
                                          imageList[index],
                                          fit: BoxFit.fill,
                                        )),
                                    selectedIndex == index
                                        ? Text(
                                            titleList[index],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: darkBlueColor,
                                            ),
                                          )
                                        : Text(
                                            titleList[index],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: darkBlueColor,
                                            ),
                                          )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 17,
                            );
                          },
                          itemCount: 3),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getLocationData() async {
    locationData = await lac.Location().getLocation();
    final currentLatLng =
        LatLng(locationData!.latitude!, locationData!.longitude!);
    _markers.add(Marker(
      markerId: const MarkerId("1"),
      position: currentLatLng,
    ));
    final controller = await mapController.future;
    await controller.animateCamera(CameraUpdate.newLatLng(currentLatLng));
    setState(() {});

    getLocationAddress(address);
  }

  Future<void> getLocationAddress(List<Placemark>? placeMark) async {
    try {
      if (locationData != null) {
        placeMark = await placemarkFromCoordinates(
          locationData!.latitude!,
          locationData!.longitude!,
        );
        setState(() {
          address = placeMark;
        });
      }
    } catch (e, st) {
      AsyncValue.error(e, st);
    }
  }
}

final locationProvider =
    StateNotifierProvider<LocationNotifier, AsyncValue<LocationModel?>>((ref) {
  return LocationNotifier();
});

class LocationNotifier extends StateNotifier<AsyncValue<LocationModel?>> {
  LocationNotifier() : super(const AsyncLoading());
  
}
