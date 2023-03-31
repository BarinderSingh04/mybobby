import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mybobby/Services/local_storage_service.dart';
import 'package:mybobby/commonClass/commonColors.dart';
import 'package:mybobby/models/user.dart';
import 'package:mybobby/screens/myAddresses_screen.dart';
import 'package:mybobby/screens/myProfile.dart';
import 'package:mybobby/screens/mytrips_screens/myTrip_screen.dart';
import 'package:mybobby/screens/notifications_screen.dart';
import 'helpandsupport_screen.dart';
import 'onBoarding_screen.dart';

class DrawerWidget extends ConsumerWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    Size size = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: whiteColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(30),
        bottomRight: Radius.circular(30),
      )),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.04,
            ),
            AspectRatio(
              aspectRatio: 3 / 1.15,
              child: ListTile(
                  minVerticalPadding: 14,
                  contentPadding: EdgeInsets.zero,
                  isThreeLine: true,
                  leading: avtarWidget(user?.image),
                  title: AspectRatio(
                    aspectRatio: 1 / 0.2,
                    child: Text(
                      "${user?.firstName} ${user?.lastName}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: darkBlueColor,
                      ),
                    ),
                  ),
                  subtitle: AspectRatio(
                    aspectRatio: 1 / 0.45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user?.phone ?? "+44 1234 56789",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: darkBlueColor,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const MyProfile_Screen(isEditProfile: true),
                              ),
                            );
                          },
                          child: const Text(
                            "View Profile",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: navyBlueColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 56,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: lightGreyColor)),
                      child: Image.asset("assets/images/cross.png"),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 1),
              child: Column(
                children: [
                  const Divider(
                    color: lightGreyColor,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: size.height * 0.032,
                  ),
                  AspectRatio(
                    aspectRatio: 1 / 0.1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyTrip()));
                      },
                      child: Row(
                        children: [
                          AspectRatio(
                              aspectRatio: 1 / 1,
                              child: Image.asset(
                                'assets/images/carsteering.png',
                                fit: BoxFit.fill,
                              )),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          const Text(
                            "My Tips",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF010317)),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  AspectRatio(
                    aspectRatio: 1 / 0.1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Notifications_Screen()));
                      },
                      child: Row(
                        children: [
                          AspectRatio(
                              aspectRatio: 1 / 1,
                              child: Image.asset(
                                'assets/images/notification.png',
                                fit: BoxFit.fill,
                              )),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          const Text(
                            "Notifications",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: darkBlueColor),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  AspectRatio(
                    aspectRatio: 1 / 0.1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyAddresses_Screen()));
                      },
                      child: Row(
                        children: [
                          AspectRatio(
                              aspectRatio: 1 / 1,
                              child: Image.asset(
                                'assets/images/address.png',
                                fit: BoxFit.fill,
                              )),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          const Text(
                            "My Addresses",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: darkBlueColor),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  AspectRatio(
                    aspectRatio: 1 / 0.1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HelpAndSupport_Screen()));
                      },
                      child: Row(
                        children: [
                          AspectRatio(
                              aspectRatio: 1 / 1,
                              child: Image.asset(
                                'assets/images/support.png',
                                fit: BoxFit.fill,
                              )),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          const Text(
                            "Help & Support",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF010317)),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  AspectRatio(
                    aspectRatio: 1 / 0.1,
                    child: GestureDetector(
                      onTap: () {
                        ref.read(localStorageProvider).clearSession();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const OnBoarding_Screen(),
                            ),
                            (route) => false);
                      },
                      child: Row(
                        children: [
                          AspectRatio(
                              aspectRatio: 1 / 1,
                              child: Image.asset(
                                'assets/images/logout.png',
                                fit: BoxFit.fill,
                              )),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          const Text(
                            "Logout",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF010317)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// profile Image
  Widget avtarWidget(String? profile) {
    if (profile?.isNotEmpty ?? false) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: CachedNetworkImage(
          imageUrl: profile!,
          height: 50,
          width: 50,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Image.asset("assets/images/profilepic.png");
    }
  }
}
