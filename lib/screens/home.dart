import 'dart:async';
import 'package:flutter/material.dart' hide MenuBar;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mybobby/Services/location_service.dart';
import 'package:mybobby/commonClass/commonColors.dart';
import 'package:mybobby/models/autocomplete_state.dart';
import 'package:mybobby/screens/search_screen.dart';
import 'package:mybobby/services/places_service.dart';
import 'package:mybobby/widgets/menu_button.dart';

import '../models/location_data.dart';
import '../models/user_detail.dart';
import 'drawer_widget.dart';

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

  GoogleMapController? mapController;
  int selectedIndex = -1;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    Size size = MediaQuery.of(context).size;
    final locationState = ref.watch(locationProvider);
    ref.listen<AsyncValue<LocationData>>(locationProvider, (previous, next) {
      next.when(
        data: (data) {
          final value = data;
          mapController
              ?.animateCamera(CameraUpdate.newLatLng(value.currentLocation));
        },
        error: (e, st) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.toString()),
            ),
          );
        },
        loading: () {},
      );
    });

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        key: _key,
        drawer: const DrawerWidget(),
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 1.3,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                mapToolbarEnabled: true,
                buildingsEnabled: true,
                myLocationButtonEnabled: false,
                zoomGesturesEnabled: false,
                initialCameraPosition: const CameraPosition(
                  target: LatLng(30.7333, 76.7794),
                  zoom: 14,
                ),
                mapType: MapType.normal,
                zoomControlsEnabled: true,
                markers: locationState.valueOrNull?.markers.toSet() ?? {},
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
                width: size.width,
                height: size.height * 0.44,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
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
                      height: size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/bluearrow.png"),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Expanded(
                          child: Text(
                            locationState.valueOrNull?.startPlaceModel?.name ??
                                "Getting your location...",
                            maxLines: 2,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: darkBlueColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.024,
                    ),
                    InkWell(
                      onTap: () {
                        final location = locationState.asData?.value;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchScreen(
                              selectedStartPlace: location?.startPlaceModel,
                            ),
                          ),
                        );
                      },
                      child: Container(
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
                              offset: const Offset(0, 3),
                            ),
                          ],
                          border: Border.all(
                            color: lightGreyColor,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 17,
                            ),
                            Center(
                              child: Image.asset(
                                "assets/images/searchicon.png",
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            const Expanded(
                              child: Text(
                                "Search Destination",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: grayColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
                        itemCount: 3,
                      ),
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
}

final locationProvider =
    AsyncNotifierProvider<LocationNotifier, LocationData>(LocationNotifier.new);

class LocationNotifier extends AsyncNotifier<LocationData> {
  @override
  FutureOr<LocationData> build() {
    return getLocationData();
  }

  Future<LocationData> getLocationData() async {
    try {
      final location = await getCurrentLocation();
      final placeModel = await getPlaceName(location);
      final marker = getMarker(location);
      return LocationData(
        currentLocation: location,
        startPlaceModel: placeModel,
        markers: [marker],
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<LatLng> getCurrentLocation() async {
    try {
      final permissionStatus =
          await ref.read(locationServiceProvider).getPermissionStatus();
      final location =
          await ref.read(locationServiceProvider).getLocation(permissionStatus);
      if (location.latitude != null && location.longitude != null) {
        return LatLng(location.latitude!, location.longitude!);
      } else {
        return Future.error("Unable to get your location");
      }
    } catch (e) {
      rethrow;
    }
  }

  Marker getMarker(LatLng location) {
    return Marker(markerId: const MarkerId("user"), position: location);
  }

  Future<PlaceModel> getPlaceName(LatLng location) async {
    try {
      return await ref.read(placeServiceProvider).getPlaceModel(location);
    } catch (e) {
      rethrow;
    }
  }
}
