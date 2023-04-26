import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:mybobby/Services/location_service.dart';
import 'package:mybobby/commonClass/commonColors.dart';
import 'package:mybobby/screens/home.dart';
import 'package:mybobby/widgets/custombutton.dart';

class RequestLocationScreen extends ConsumerStatefulWidget {
  const RequestLocationScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<RequestLocationScreen> createState() =>
      RequestLocationScreenState();
}

class RequestLocationScreenState extends ConsumerState<RequestLocationScreen> {
  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<PermissionStatus?>>(requestLocationProvider,
        (previous, next) {
      next.when(
        data: (data) {
          if (data != null) {
            if (data == PermissionStatus.granted ||
                data == PermissionStatus.grantedLimited) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            }
          }
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

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.white),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.asset("assets/images/locationbg.png",
                fit: BoxFit.contain),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: const [
                      Text(
                        "Allow Location",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 28,
                          color: darkBlueColor,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "This app requires that Location services are "
                        "turned on your device and for this app. You must "
                        "enable them in settings before using this app.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: sliverColor,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CustomButton(
                        title: "Allow only while using the app",
                        onPressed: () async {
                          ref
                              .read(requestLocationProvider.notifier)
                              .requestPermission();
                        },
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Don't allow this app",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: darkBlueColor,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final requestLocationProvider = AutoDisposeAsyncNotifierProvider<
    RequestLocationNotifier, PermissionStatus?>(RequestLocationNotifier.new);

class RequestLocationNotifier
    extends AutoDisposeAsyncNotifier<PermissionStatus?> {
  @override
  FutureOr<PermissionStatus?> build() async {
    return null;
  }

  Future<void> requestPermission() async {
    try {
      state = const AsyncLoading();
      final permissionStatus =
          await ref.read(locationServiceProvider).requestPermission();
      state = AsyncData(permissionStatus);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
