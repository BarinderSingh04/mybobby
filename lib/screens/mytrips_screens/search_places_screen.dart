import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mybobby/Services/dioNetworkClass.dart';
import 'package:mybobby/commonClass/commonColors.dart';
import 'package:mybobby/widgets/circleBackButton.dart';

class SearchPlacesScreen extends ConsumerStatefulWidget {
  const SearchPlacesScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<SearchPlacesScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchPlacesScreen> {
  TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    final autoCompleteState = ref.watch(autoCompleteProvider);

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Search",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Color(0xFF010317)),
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
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 13.5),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.08,
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
                    color: lightGreyColor, width: 1, style: BorderStyle.solid),
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
                hintText: "Search Destination",
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: grayColor,
                ),
              ),
            ),
          ),
          autoCompleteState.when(
            data: (data) {
              if (data == null || data.isEmpty) {
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
              } else {
                return Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(24),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final Map<String, dynamic> prediction = data[index];
                      return ListTile(
                        onTap: () {
                          Navigator.of(context)
                              .pop(prediction["description"]);
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
                        title: Text(
                          prediction["description"] ?? "",
                          style: const TextStyle(
                            color: Color(0xFF010317),
                            fontSize: 16,
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
            loading: () => SizedBox.fromSize(
              size: const Size.fromHeight(200),
              child: const Center(child: CircularProgressIndicator()),
            ),
            error: (e, st) {
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

final googlePlaceProvider = Provider<GooglePlacesService>((ref) {
  return GooglePlacesService("AIzaSyClf3Fdm00zQR4R2ssUjW-uZ9GC2ijYN2w");
});

final autoCompleteProvider = StateNotifierProvider.autoDispose<
    AutoCompleteNotifier, AsyncValue<List<dynamic>?>>((ref) {
  return AutoCompleteNotifier(ref.watch(googlePlaceProvider));
});

class AutoCompleteNotifier extends StateNotifier<AsyncValue<List<dynamic>>> {
  final GooglePlacesService _googlePlace;
  AutoCompleteNotifier(this._googlePlace) : super(const AsyncData([]));

  void clearResults() {
    state = const AsyncValue.data([]);
  }

  Future<void> getAutoCompleteResults(String search) async {
    try {
      state = const AsyncValue.loading();
      var result = await _googlePlace.getRequest(input: search);
      if (result.isNotEmpty) {
        state = AsyncValue.data(result);
      } else {
        state = const AsyncData([]);
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
