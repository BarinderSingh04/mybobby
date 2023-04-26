import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mybobby/models/autocomplete_state.dart';
import 'package:mybobby/screens/confirm_trip_screen.dart';
import 'package:mybobby/screens/mytrips_screens/search_places_screen.dart';
import 'package:mybobby/services/local_storage_service.dart';
import 'package:timelines/timelines.dart';

import '../widgets/custombutton.dart';

final recentsProvider = Provider<List<PlaceModel>?>((ref) {
  return ref.read(localStorageProvider).recentSelection();
});

class SearchScreen extends ConsumerStatefulWidget {
  final PlaceModel? selectedStartPlace;
  const SearchScreen({
    Key? key,
    required this.selectedStartPlace,
  }) : super(key: key);

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  String dropdownvalue = 'Classic';
  PlaceModel? selectedStartLocation;
  PlaceModel? selectedDestinationLocation;

  @override
  void initState() {
    super.initState();
    selectedStartLocation = widget.selectedStartPlace;
  }

  var items = [
    "Classic",
    "Rocky",
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF002F60),
        elevation: 0,
        leadingWidth: 80,
        centerTitle: true,
        leading: Center(
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Cancel",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFFFFFFFF),),
            ),
          ),
        ),
        title: Container(
          width: size.width * 0.55,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              const Text(
                "Driver type ",
                style: TextStyle(
                    color: Color(0xFF15192C),
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              const SizedBox(width: 4.0),
              Expanded(
                child: DropdownButton(
                  isExpanded: true,
                  value: dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      alignment: Alignment.center,
                      child: Text(
                        items,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFF15192C),),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFF002F60),
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Container(
                height: 200,
                width: size.width,
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: Color(0xFF002F60),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(22),
                    bottomRight: Radius.circular(22),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: FixedTimeline(
                    direction: Axis.vertical,
                    children: [
                      TimelineTile(
                        mainAxisExtent: 84,
                        nodeAlign: TimelineNodeAlign.start,
                        node: const TimelineNode(
                          indicator: OutlinedDotIndicator(
                            color: Color(0xFFFAE046),
                            size: 24,
                            borderWidth: 8,
                            backgroundColor: Colors.white,
                          ),
                          endConnector: DecoratedLineConnector(
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
                        contents: InkWell(
                          onTap: () async {
                            final PlaceModel? result =
                                await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SearchPlacesScreen(
                                  isDestination: false,
                                  selectedLocationName:
                                      selectedStartLocation?.name,
                                ),
                              ),
                            );
                            if (result != null) {
                              setState(() {
                                selectedStartLocation = result;
                              });
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Start",
                                  style: TextStyle(
                                    color: Color(0xFF010317),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  selectedStartLocation?.name ??
                                      "Select Start Location...",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: selectedStartLocation == null
                                        ? Colors.grey[400]
                                        : const Color(0xFF212334),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(height: 0),
                      TimelineTile(
                        mainAxisExtent: 84,
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
                          startConnector: DecoratedLineConnector(
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
                        contents: InkWell(
                          onTap: () async {
                            final PlaceModel? result =
                                await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SearchPlacesScreen(
                                  isDestination: true,
                                  selectedLocationName:
                                      selectedDestinationLocation?.name,
                                ),
                              ),
                            );
                            setState(() {
                              selectedDestinationLocation = result;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Destination",
                                  style: TextStyle(
                                    color: Color(0xFF010317),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  selectedDestinationLocation?.name ??
                                      "Select Destination Location...",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: selectedDestinationLocation == null
                                        ? Colors.grey[400]
                                        : const Color(0xFF212334),
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // ListTile(
              //   contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              //   minVerticalPadding: 15,
              //   leading: Image.asset("assets/images/homeicon.png"),
              //   title: const Text(
              //     "Home",
              //     style: TextStyle(
              //         color: Color(0xFF010317),
              //         fontWeight: FontWeight.w500,
              //         fontSize: 16),
              //   ),
              //   subtitle: const Text(
              //     "3517 W. Gray St. Utica, Pennsylvania 57867",
              //     style: TextStyle(
              //         color: Color(0xFF868686),
              //         fontWeight: FontWeight.w400,
              //         fontSize: 16),
              //   ),
              // ),
              // ListTile(
              //   contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              //   minVerticalPadding: 15,
              //   leading: Image.asset("assets/images/homeicon.png"),
              //   title: const Text(
              //     "Office",
              //     style: TextStyle(
              //         color: Color(0xFF010317),
              //         fontWeight: FontWeight.w500,
              //         fontSize: 16),
              //   ),
              //   // subtitle: Text("3517 W. Gray St. Utica, Pennsylvania 57867",style: TextStyle(
              //   //   color: Color(0xFF868686),
              //   //   fontWeight: FontWeight.w400,
              //   //   fontSize: 16
              //   // ),),
              // ),
            ],
          ),
          Container(
            width: size.width,
            height: size.height * 0.01,
            decoration: const BoxDecoration(
              color: Color(0xFFF4F5F5),
            ),
          ),
          Expanded(
            child: Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "RECENT SEARCHES",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF010317),
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Builder(builder: (context) {
                    final recents = ref.read(recentsProvider);

                    if (recents == null || recents.isEmpty) {
                      return const Center(
                        child: EmptyWidget(text: "Lets start a ride"),
                      );
                    }

                    return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final recent = recents[index];
                        return ListTile(
                          onTap: () {
                            setState(() {
                              selectedDestinationLocation = recent;
                            });
                          },
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 1,
                                style: BorderStyle.solid,
                                color: const Color(0xFFEBEBEB),
                              ),
                              color: const Color(0x0ff4f5f5),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.location_on,
                                color: Color(0xFF010317),
                              ),
                            ),
                          ),
                          title: Text(
                            recent.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Color(0xFF010317),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        );
                      },
                      itemCount: recents.length,
                      separatorBuilder: (context, index) {
                        return const Divider(
                          thickness: 1,
                          color: Color(0xFFEBEBEB),
                        );
                      },
                    );
                  })
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: CustomButton(
                title: "Continue",
                onPressed: selectedDestinationLocation == null ||
                        selectedStartLocation == null
                    ? null
                    : () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ConfirmTripScreen(
                              selectedStartLocation!,
                              selectedDestinationLocation!,
                            ),
                          ),
                        );
                      },
              ),
            ),
          )
        ],
      ),
    );
  }
}
