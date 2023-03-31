import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mybobby/screens/mytrips_screens/search_places_screen.dart';
import 'package:timelines/timelines.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String dropdownvalue = 'Classic';
  String? selectedLocation;
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
                  color: Color(0xFFFFFFFF)),
            ),
          ),
        ),
        title: Container(
          width: size.width * 0.55,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25)),
          child: Row(
            children: [
              const Text(
                "Driver type ",
                style: TextStyle(
                    color: Color(0xFF15192C),
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              Expanded(
                child: DropdownButton(
                  value: dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(
                        items,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFF15192C)),
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
            statusBarBrightness: Brightness.dark),
      ),
      body: Column(
        children: [
          Container(
            height: size.height * 0.42,
            width: size.width,
            decoration: const BoxDecoration(color: Colors.white54),
            child: Column(
              children: [
                Container(
                  height: size.height * 0.22,
                  width: size.width,
                  // padding: EdgeInsets.only(bottom: 10),
                  decoration: const BoxDecoration(
                    color: Color(0xFF002F60),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(22),
                      bottomRight: Radius.circular(22),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: size.height * 0.18,
                          width: size.width * 0.85,
                          padding: const EdgeInsets.only(
                            left: 12,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: FixedTimeline(
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
                                    height: 22,
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
                                contents: Row(
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.03,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          "Start",
                                          style: TextStyle(
                                            color: Color(0xFF010317),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          "3517 W. Gray St. Utica, Pennsylvani...",
                                          style: TextStyle(
                                            color: Color(0xFF212334),
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
                                    color: Color(
                                      0xFF002F60,
                                    ),
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
                                contents: Row(
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.03,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Text(
                                          "Destination",
                                          style: TextStyle(
                                            color: Color(0xFF010317),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.005,
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            final String? result =
                                                await Navigator.of(context)
                                                    .push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const SearchPlacesScreen(),
                                              ),
                                            );
                                            if (result != null) {
                                              setState(() {
                                                selectedLocation = result;
                                              });
                                            }
                                          },
                                          child: SizedBox(
                                            width: size.width * 0.6,
                                            height: size.height * 0.04,
                                            child: Text(
                                              selectedLocation ??
                                                  "Select Destination location",
                                              style: TextStyle(
                                                color: selectedLocation == null
                                                    ? Colors.grey[400]
                                                    : const Color(0xFF212334),
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
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
                      const Align(
                          alignment: Alignment.center, child: Divider()),
                    ],
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  minVerticalPadding: 15,
                  leading: Image.asset("assets/images/homeicon.png"),
                  title: const Text(
                    "Home",
                    style: TextStyle(
                        color: Color(0xFF010317),
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  subtitle: const Text(
                    "3517 W. Gray St. Utica, Pennsylvania 57867",
                    style: TextStyle(
                        color: Color(0xFF868686),
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  minVerticalPadding: 15,
                  leading: Image.asset("assets/images/homeicon.png"),
                  title: const Text(
                    "Office",
                    style: TextStyle(
                        color: Color(0xFF010317),
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  // subtitle: Text("3517 W. Gray St. Utica, Pennsylvania 57867",style: TextStyle(
                  //   color: Color(0xFF868686),
                  //   fontWeight: FontWeight.w400,
                  //   fontSize: 16
                  // ),),
                ),
              ],
            ),
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
                        letterSpacing: 1),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: size.height * 0.1,
                          child: GestureDetector(
                            onTap: () {
                              //   Navigator.push(context, MaterialPageRoute(builder: (context)=>const ConfirmTrip_Screen()));
                            },
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Container(
                                width: 42,
                                height: 42,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: const Color(0xFFEBEBEB)),
                                  color: const Color(0x0ff4f5f5),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.location_on,
                                    color: Color(0xFF010317),
                                  ),
                                ),
                              ),
                              title: const Text(
                                "San Francisco, California",
                                style: TextStyle(
                                    color: Color(0xFF010317),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                              subtitle: const Text(
                                "3517 W. Gray St. Utica, Pennsylvania 57867",
                                style: TextStyle(
                                  color: Color(0xFF868686),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: 20,
                      separatorBuilder: (context, index) {
                        return const Divider(
                            thickness: 1, color: Color(0xFFEBEBEB));
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
