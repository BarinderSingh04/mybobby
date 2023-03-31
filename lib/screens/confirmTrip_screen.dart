import 'package:flutter/material.dart' hide MenuBar;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:mybobby/commonClass/commonColors.dart';
import 'package:mybobby/models/SaveRide.dart';
import 'package:mybobby/models/user.dart';
import 'package:mybobby/providerNotifier/saveRise_user_notifier.dart';
import 'package:mybobby/screens/tracking_screen.dart';
import 'package:mybobby/widgets/custombutton.dart';
import 'package:mybobby/widgets/loading_dialog.dart';
import 'package:timelines/timelines.dart';

import '../widgets/menuButton.dart';

class ConfirmTrip_Screen extends ConsumerStatefulWidget {
  final double? lat;
  final double? lng;
  const ConfirmTrip_Screen({Key? key, this.lat, this.lng}) : super(key: key);

  @override
  ConsumerState<ConfirmTrip_Screen> createState() => _ConfirmTrip_ScreenState();
}

class _ConfirmTrip_ScreenState extends ConsumerState<ConfirmTrip_Screen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final saveRideUpdate = ref.watch(saveRideNotifierProvider);
    ref.listen<AsyncValue<SaveRide?>>(saveRideNotifierProvider,
        (previous, state) {
      state.when(
        data: (data) {
          if (data != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Tracking_Screen()));
            ref.read(saveRideProvide.notifier).update((state) => data);
          }
        },
        error: (error, stackTrace) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                error.toString(),
              ),
            ),
          );
        },
        loading: () {},
      );
    });
    return Material(
      child: LoadingOverlay(
        isLoading: saveRideUpdate.isLoading,
        opacity: 0.8,
        progressIndicator: const LoadingDialog(),
        color: whiteColor,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: Scaffold(
            key: _key,
            drawer: const Drawer(),
            body: Stack(
              children: [
                Container(
                  width: size.width,
                  height: size.height,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/confirmtrip.png"),
                          fit: BoxFit.fill)),
                ),
                Positioned(
                  top: MediaQuery.of(context).viewPadding.top + 25,
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
                    height: size.height * 0.45,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 36),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                        ),
                        boxShadow: [
                          BoxShadow(color: blackColor.withOpacity(0.12))
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "TRIP DETAILS",
                          style: TextStyle(
                              color: darkBlueColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              letterSpacing: 1),
                        ),
                        SizedBox(
                          height: size.height * 0.024,
                        ),
                        FixedTimeline(
                          direction: Axis.vertical,
                          children: [
                            TimelineTile(
                              nodeAlign: TimelineNodeAlign.start,
                              node: const TimelineNode(
                                indicator: OutlinedDotIndicator(
                                  color: yellowColor,
                                  size: 23,
                                  borderWidth: 8,
                                  backgroundColor: Colors.white,
                                ),
                                endConnector: SizedBox(
                                  height: 22,
                                  child: DecoratedLineConnector(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomCenter,
                                        colors: yellowGradientColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              contents: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.03,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Start",
                                        style: TextStyle(
                                          color: darkBlueColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        "3517 W. Gray St. Utica, Pennsylvani...",
                                        style: TextStyle(
                                          color: darkNavyBlueColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            TimelineTile(
                              nodeAlign: TimelineNodeAlign.start,
                              node: const TimelineNode(
                                indicator: OutlinedDotIndicator(
                                  color: navyBlueColor,
                                  size: 23,
                                  borderWidth: 8,
                                  backgroundColor: Colors.white,
                                ),
                                startConnector: SizedBox(
                                  height: 24,
                                  child: DecoratedLineConnector(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomCenter,
                                          colors: creamGradientColor),
                                    ),
                                  ),
                                ),
                              ),
                              contents: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.03,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Destination",
                                        style: TextStyle(
                                          color: darkBlueColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.005,
                                      ),
                                      const Text(
                                        "8502 Preston Rd. Inglewood, Maine 98380",
                                        style: TextStyle(
                                          color: darkNavyBlueColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
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
                        onPressed: () {
                          final userId = ref.read(userProvider)!.id;
                          ref
                              .read(saveRideNotifierProvider.notifier)
                              .saveRideUser(userId!, widget.lat!, widget.lng!);
                        }),
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
