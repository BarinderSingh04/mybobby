import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart'
    hide LatLng;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mybobby/commonClass/commonColors.dart';
import 'package:mybobby/models/autocomplete_state.dart';
import 'package:mybobby/screens/search_screen.dart';
import 'package:mybobby/services/local_storage_service.dart';
import 'package:mybobby/widgets/circleBackButton.dart';

class SearchPlacesScreen extends ConsumerStatefulWidget {
  final bool isDestination;
  final String? selectedLocationName;

  const SearchPlacesScreen({
    required this.selectedLocationName,
    required this.isDestination,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<SearchPlacesScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchPlacesScreen> {
  TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    if (widget.selectedLocationName != null) {
      searchController.text = widget.selectedLocationName!;
      Future.microtask(() => ref
          .read(autoCompleteProvider.notifier)
          .getAutoCompleteResults(widget.selectedLocationName!));
    }
  }

  @override
  Widget build(BuildContext context) {
    final autoCompleteState = ref.watch(autoCompleteProvider);

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFF002F60),
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        backgroundColor: const Color(0xFF002F60),
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.isDestination ? "Search Destination" : "Search Start",
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 14),
          child: CircleBack_Button(
            onPressed: () {
              Navigator.of(context).pop();
              FocusScope.of(context).unfocus();
            },
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(22.0),
            decoration: const BoxDecoration(
              color: Color(0xFF002F60),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(22),
                bottomRight: Radius.circular(22),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 14,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                  color: whiteColor,
                  border: Border.all(
                    color: lightGreyColor,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(8)),
              child: TextField(
                controller: searchController,
                onChanged: (v) {
                  if (_debounce?.isActive ?? false) _debounce?.cancel();
                  _debounce = Timer(const Duration(milliseconds: 800), () {
                    ref
                        .read(autoCompleteProvider.notifier)
                        .getAutoCompleteResults(v);
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: Image.asset("assets/images/searchicon.png"),
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      searchController.clear();
                      ref.read(autoCompleteProvider.notifier).clearResults();
                    },
                  ),
                  hintText: "Search location",
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: grayColor,
                  ),
                ),
              ),
            ),
          ),
          autoCompleteState.when(
            suggestions: (data) {
              if (data.autoCompleteResults.isEmpty) {
                return const EmptyWidget(
                  text: "Enter location name or address to pick a ride",
                );
              } else {
                return Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    itemCount: data.autoCompleteResults.length,
                    itemBuilder: (context, index) {
                      final prediction = data.autoCompleteResults[index];
                      return ListTile(
                        onTap: () {
                          final placeModel = PlaceModel(
                            id: prediction.placeId,
                            name: prediction.fullText,
                          );

                          Navigator.of(context).pop(placeModel);
                          if (widget.isDestination) {
                            ref
                                .read(localStorageProvider)
                                .saveRecentDestinationSelection(placeModel);
                            ref.invalidate(recentsProvider);
                          }
                        },
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 24.0),
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
                          prediction.fullText,
                          style: const TextStyle(
                            color: Color(0xFF010317),
                            fontSize: 16,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                  ),
                );
              }
            },
            loading: () => SizedBox.fromSize(
              size: const Size.fromHeight(200),
              child: const Center(child: CircularProgressIndicator()),
            ),
            init: () {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 48.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/driver.png",
                        fit: BoxFit.fill,
                        width: 150,
                        height: 150,
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        "Enter location name or address to pick a ride",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            error: (e) {
              return Center(
                child: Text(e.toString()),
              );
            },
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }
}

class EmptyWidget extends StatelessWidget {
  final String text;
  const EmptyWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/driver.png",
          fit: BoxFit.fill,
          width: 150,
          height: 150,
        ),
        const SizedBox(height: 16.0),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

final googlePlaceProvider = Provider<FlutterGooglePlacesSdk>((ref) {
  return FlutterGooglePlacesSdk("AIzaSyClf3Fdm00zQR4R2ssUjW-uZ9GC2ijYN2w");
});

final autoCompleteProvider =
    StateNotifierProvider.autoDispose<AutoCompleteNotifier, AutoCompleteState>(
        (ref) {
  return AutoCompleteNotifier(ref.watch(googlePlaceProvider));
});

class AutoCompleteNotifier extends StateNotifier<AutoCompleteState> {
  final FlutterGooglePlacesSdk _googlePlace;
  AutoCompleteNotifier(this._googlePlace)
      : super(const AutoCompleteState.init());

  void clearResults() {
    state = state = AutoCompleteState.suggestions(
      AutoCompleteModel(autoCompleteResults: List.empty()),
    );
  }

  Future<void> getAutoCompleteResults(String search) async {
    try {
      if (search.isNotEmpty) {
        state = const AutoCompleteState.loading();
        var result = await _googlePlace.findAutocompletePredictions(search);
        if (result.predictions.isNotEmpty) {
          state = AutoCompleteState.suggestions(
            AutoCompleteModel(autoCompleteResults: result.predictions),
          );
        } else {
          clearResults();
        }
      }
    } catch (e) {
      state = AutoCompleteState.error(e);
    }
  }
}
