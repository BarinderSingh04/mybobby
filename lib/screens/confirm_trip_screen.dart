import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart' hide MenuBar;
import 'package:flutter/services.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart'
    hide LatLng;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:mybobby/commonClass/commonColors.dart';
import 'package:mybobby/models/autocomplete_state.dart';
import 'package:mybobby/models/location_data.dart';
import 'package:mybobby/models/ride.dart';
import 'package:mybobby/repositories/ride_repo.dart';
import 'package:mybobby/screens/mytrips_screens/search_places_screen.dart';
import 'package:mybobby/screens/tracking_screen.dart';
import 'package:mybobby/services/booking_service.dart';
import 'package:mybobby/services/direction_service.dart';
import 'package:mybobby/services/local_storage_service.dart';
import 'package:mybobby/widgets/custombutton.dart';
import 'package:mybobby/widgets/loading_dialog.dart';
import 'package:timelines/timelines.dart';

import '../models/user_detail.dart';

class ConfirmTripScreen extends ConsumerStatefulWidget {
  final PlaceModel start;
  final PlaceModel end;
  const ConfirmTripScreen(this.start, this.end, {Key? key}) : super(key: key);

  @override
  ConsumerState<ConfirmTripScreen> createState() => _ConfirmTripScreenState();
}

class _ConfirmTripScreenState extends ConsumerState<ConfirmTripScreen> {
  GoogleMapController? mapController;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref
        .read(confirmTripProvider.notifier)
        .tracking(widget.start.id, widget.end.id));
  }

  @override
  void dispose() {
    mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final tripState = ref.watch(confirmTripProvider);
    final bookRideState = ref.watch(bookRideProvider);

    ref.listen<AsyncValue<Ride?>>(bookRideProvider, (previous, next) {
      next.mapOrNull(
        data: (_) {
          if (_.value != null) {
            ref.read(localStorageProvider).saveRide(_.value!);
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => TrackingScreen(rideId: _.value!.id),
              ),
              (route) => false,
            );
          }
        },
        error: (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.error.toString()),
            ),
          );
        },
      );
    });

    ref.listen<AsyncValue<LocationData?>>(confirmTripProvider,
        (previous, state) {
      state.maybeMap(
        data: (data) async {
          if (data.value != null) {
            final value = data.value;
            mapController?.animateCamera(
                CameraUpdate.newLatLngBounds(value!.latLngBounds!, 100));
          }
        },
        error: (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.error.toString()),
            ),
          );
        },
        orElse: () {},
      );
    });

    return Material(
      child: LoadingOverlay(
        opacity: 0.8,
        color: whiteColor,
        progressIndicator: const LoadingDialog(),
        isLoading: tripState is AsyncLoading || bookRideState is AsyncLoading,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: Scaffold(
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
                    initialCameraPosition: const CameraPosition(
                      zoom: 14,
                      target: LatLng(30.7333, 76.7794),
                    ),
                    mapType: MapType.normal,
                    zoomControlsEnabled: true,
                    polylines: Set.of(tripState.asData?.value?.polylines ?? []),
                    markers: Set.of(tripState.asData?.value?.markers ?? []),
                    onMapCreated: (GoogleMapController controller) {
                      mapController = controller;
                    },
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).viewPadding.top + 25,
                  left: 16,
                  right: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          shadowColor: const Color(0xff000014),
                          shape: const CircleBorder(
                            side: BorderSide(
                              style: BorderStyle.solid,
                              color: Color(0xFFEBEBEB),
                              width: 1,
                            ),
                          ),
                          backgroundColor: const Color(0xFFFFFFFF),
                          padding: const EdgeInsets.all(15),
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: size.width,
                    height: size.height * 0.45,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 36,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25),
                      ),
                      boxShadow: [
                        BoxShadow(color: blackColor.withOpacity(0.12))
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "TRIP DETAILS",
                          style: TextStyle(
                            color: darkBlueColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            letterSpacing: 1,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.024,
                        ),
                        FixedTimeline(
                          direction: Axis.vertical,
                          children: [
                            TimelineTile(
                              mainAxisExtent: 100,
                              nodeAlign: TimelineNodeAlign.start,
                              node: const TimelineNode(
                                indicator: OutlinedDotIndicator(
                                  color: yellowColor,
                                  size: 23,
                                  borderWidth: 8,
                                  backgroundColor: Colors.white,
                                ),
                                endConnector: DecoratedLineConnector(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter,
                                      colors: yellowGradientColor,
                                    ),
                                  ),
                                ),
                              ),
                              contents: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Start",
                                      style: TextStyle(
                                        color: darkBlueColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(height: 4.0),
                                    Text(
                                      tripState.when(data: (data) {
                                        return data?.startPlaceModel?.name ??
                                            "Getting location info...";
                                      }, error: (e, st) {
                                        return e.toString();
                                      }, loading: () {
                                        return "Getting location info...";
                                      }),
                                      style: const TextStyle(
                                        color: darkNavyBlueColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            TimelineTile(
                              mainAxisExtent: 100,
                              nodeAlign: TimelineNodeAlign.start,
                              node: const TimelineNode(
                                indicator: OutlinedDotIndicator(
                                  color: navyBlueColor,
                                  size: 23,
                                  borderWidth: 8,
                                  backgroundColor: Colors.white,
                                ),
                                startConnector: DecoratedLineConnector(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter,
                                      colors: creamGradientColor,
                                    ),
                                  ),
                                ),
                              ),
                              contents: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Destination",
                                      style: TextStyle(
                                        color: darkBlueColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(height: 4.0),
                                    Text(
                                      tripState.when(data: (data) {
                                        return data?.endPlaceModel?.name ??
                                            "Getting location info...";
                                      }, error: (e, st) {
                                        return e.toString();
                                      }, loading: () {
                                        return "Getting location info...";
                                      }),
                                      style: const TextStyle(
                                        color: darkNavyBlueColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: CustomButton(
                      title: "Confirm Request",
                      onPressed: tripState is AsyncData
                          ? () {
                              ref.read(bookRideProvider.notifier).bookRide(
                                    tripState.value!.startPlaceModel!,
                                    tripState.value!.endPlaceModel!,
                                  );
                            }
                          : null,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final bookRideProvider =
    StateNotifierProvider.autoDispose<BookRideNotifier, AsyncValue<Ride?>>(
        (ref) {
  return BookRideNotifier(
    ref.watch(rideRepositoryProvider),
    ref.watch(userProvider)!.id!,
  );
});

class BookRideNotifier extends StateNotifier<AsyncValue<Ride?>> {
  final String customerId;
  final RideRepository _rideRepository;
  BookRideNotifier(this._rideRepository, this.customerId)
      : super(const AsyncData(null));

  Future<void> bookRide(PlaceModel start, PlaceModel end) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final ride = await _rideRepository.bookRide(
        customerId,
        start,
        end,
        RideStatus.created,
      );
      return ride;
    });
  }
}

final confirmTripProvider = StateNotifierProvider.autoDispose<
    ConfirmTripNotifier, AsyncValue<LocationData?>>(
  (ref) => ConfirmTripNotifier(
    ref.watch(directionServiceProvider),
    ref.watch(googlePlaceProvider),
  ),
);

class ConfirmTripNotifier extends StateNotifier<AsyncValue<LocationData?>> {
  final FlutterGooglePlacesSdk _placesSdk;
  final DirectionsServices _directionsServices;
  ConfirmTripNotifier(this._directionsServices, this._placesSdk)
      : super(const AsyncValue.data(null));

  Future<void> tracking(String start, String end) async {
    try {
      List<Polyline> polylines = [];
      List<Marker> markers = [];
      state = const AsyncValue.loading();

      final locations = await Future.wait([
        getLocationData(start),
        getLocationData(end),
      ]);

      final PlaceModel? origin = locations.firstOrNull;
      final PlaceModel? destination = locations.lastOrNull;

      if (origin != null && destination != null) {
        final directions = await _directionsServices.getRouteCoordinates(
          origin.location!,
          destination.location!,
        );
        markers.add(
          Marker(
            markerId: const MarkerId("origin"),
            icon: await markerIcon("assets/images/user.png"),
            position: LatLng(
              origin.location!.latitude,
              origin.location!.longitude,
            ),
          ),
        );
        markers.add(Marker(
          markerId: const MarkerId("destination"),
          icon: await markerIcon("assets/images/destination.png"),
          position: LatLng(
            destination.location!.latitude,
            destination.location!.longitude,
          ),
        ));
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
            LocationData(
              polylines: polylines,
              markers: markers,
              totalDistance: directions.totalDistance,
              latLngBounds: directions.bounds,
              startPlaceModel: origin,
              endPlaceModel: destination,
            ),
          );
        } else {
          state = const AsyncError(
            "Unable to find a route from your coordinates!",
            StackTrace.empty,
          );
        }
      } else {
        state = const AsyncError(
          "Unable to get location!",
          StackTrace.empty,
        );
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<PlaceModel?> getLocationData(String placeId) async {
    try {
      final response = await _placesSdk.fetchPlace(placeId, fields: [
        PlaceField.Location,
        PlaceField.Address,
      ]);
      final location = response.place?.latLng;
      final name = response.place?.address;
      if (location != null && name != null) {
        return PlaceModel(
          id: placeId,
          name: name,
          location: LatLng(location.lat, location.lng),
        );
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<BitmapDescriptor> markerIcon(String asset) async {
    return BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(10, 10), devicePixelRatio: 3),
      asset,
    );
  }
}
