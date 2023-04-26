import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:mybobby/commonClass/commonColors.dart';
import 'package:mybobby/config/validators.dart';
import 'package:mybobby/screens/myProfile.dart';
import 'package:mybobby/screens/verification_screen.dart';
import 'package:mybobby/widgets/customArrowButton.dart';
import 'package:mybobby/widgets/loading_dialog.dart';

import '../models/user_detail.dart';
import '../providerNotifier/login_notifier.dart';
import 'request_location_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  int textLength = 0;
  String countryFlag = '🇧🇪';
  String countryCode = '+32';

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final updateState = ref.watch(loginNotifierProvider);
    Size size = MediaQuery.of(context).size;

    ref.listen<AsyncValue<AuthState?>>(loginNotifierProvider,
        (previous, state) {
      state.when(
        data: (data) {
          if (data != null) {
            if (data.event == AuthEvent.otpSent) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  settings: const RouteSettings(name: "/navigation"),
                  builder: (context) => const VerificationScreen(),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Otp is Sent Successfully",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            }
            if (data.event == AuthEvent.verified) {
              ref.read(userProvider.notifier).update((state) => data.user!);
              if (data.user?.firstName == null ||
                  data.user!.firstName!.isEmpty) {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const MyProfileScreen(),
                    ),
                    (route) => false);
              } else {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const RequestLocationScreen(),
                    ),
                    (route) => false);
              }
            }
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
        isLoading: updateState is AsyncLoading,
        opacity: 0.8,
        color: whiteColor,
        progressIndicator: const LoadingDialog(),
        child: Scaffold(
          backgroundColor: navyBlueColor,
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: navyBlueColor,
                statusBarIconBrightness: Brightness.light,
                statusBarBrightness: Brightness.dark),
            backgroundColor: Colors.transparent,
            centerTitle: false,
            automaticallyImplyLeading: false,
            elevation: 0,
            titleSpacing: 0,
            title: Padding(
              padding: const EdgeInsets.only(top: 18, left: 24),
              child: Image.asset(
                "assets/images/Logo.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
              margin: const EdgeInsets.only(top: 35),
              width: size.width,
              height: size.height,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(22),
                  topLeft: Radius.circular(22),
                ),
              ),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "What's your number?",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 28,
                        color: darkBlueColor,
                      ),
                    ),
                    const Text(
                      "Enter your credentials to access your account.",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: sliverColor,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.032,
                    ),
                    const Text(
                      "Phone Number",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: darkBlueColor),
                    ),
                    SizedBox(
                      height: size.height * 0.012,
                    ),
                    TextFormField(
                      onSaved:
                          ref.read(loginNotifierProvider.notifier).updatePhone,
                      style: const TextStyle(color: darkBlueColor),
                      onChanged: (val) {
                        textLength = val.length;
                      },
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {
                            showCountryPicker(
                              context: context,
                              showPhoneCode: true,
                              onSelect: (Country country) {
                                setState(() {
                                  countryFlag = country.flagEmoji;
                                  countryCode = country.phoneCode;
                                });
                              },
                              countryListTheme: CountryListThemeData(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0),
                                ),
                                // Optional. Styles the search field.
                                inputDecoration: InputDecoration(
                                  labelText: 'Search',
                                  hintText: 'Start typing to search',
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: darkSilverColor.withOpacity(0.2),
                                    ),
                                  ),
                                ),
                                searchTextStyle: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Text(
                                      countryFlag,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Image.asset(
                                    "assets/images/dropdownicon.png",
                                  ),
                                ),
                                Text(
                                  countryCode,
                                  style: const TextStyle(
                                    color: darkBlueColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                              ],
                            ),
                          ),
                        ),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: navyBlueColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade500),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: lightGreyColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        fillColor: lightColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                      validator: ref.read(validatorsProvider).validatePhone,
                    ),
                    SizedBox(
                      height: size.height * 0.076,
                    ),
                    CustomArrowButton(
                      title: "Continue",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          ref.read(loginNotifierProvider.notifier).login();
                        }
                      },
                      // customWidget: Image.asset("assets/images/whitearrowright.png")
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
