import 'dart:io';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:mybobby/commonClass/commonColors.dart';
import 'package:mybobby/config/validators.dart';
import 'package:mybobby/models/getUser.dart';
import 'package:mybobby/models/user.dart';
import 'package:mybobby/providerNotifier/update_User_notifier.dart';
import 'package:mybobby/screens/allowLocation_screen.dart';
import 'package:mybobby/widgets/circleBackButton.dart';
import 'package:mybobby/widgets/custombutton.dart';
import 'package:mybobby/widgets/loading_dialog.dart';

class MyProfile_Screen extends ConsumerStatefulWidget {
  final bool isEditProfile;

  const MyProfile_Screen({Key? key, this.isEditProfile = false})
      : super(key: key);

  @override
  ConsumerState<MyProfile_Screen> createState() => _MyProfile_ScreenState();
}

class _MyProfile_ScreenState extends ConsumerState<MyProfile_Screen> {
  int textLength = 0;
  bool isNavigator = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  XFile? image;

  Future<void> getPicker(ImageSource imageSource) async {
    try {
      image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      );
      ref
          .read(updateUserNotifierProvider.notifier)
          .onImageSaved('image', image);
      setState(() {});
    } on Exception catch (e) {
      debugPrint("Image=====Error======>$e");
      rethrow;
    }
  }

  String countryFlag = '🇺🇸';
  String countryCode = '+1';



  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);

    final updateState = ref.watch(updateUserNotifierProvider);
    ref.listen<AsyncValue<GetUser?>>(updateUserNotifierProvider,
        (previous, state) {
      state.when(
        data: (data) {
          if (data != null) {
            if (user!.firstName == null && user.lastName == null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AllowLocation_Screen()),
                  (route) => false);
            } else {
              Navigator.of(context).maybePop();
            }

            ref.read(userProvider.notifier).update((state) => data);
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

    Size size = MediaQuery.of(context).size;
    return Material(
      child: LoadingOverlay(
        isLoading: updateState.isLoading,
        opacity: 0.8,
        progressIndicator: const LoadingDialog(),
        color: whiteColor,
        child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: navyBlueColor,
                statusBarIconBrightness: Brightness.light,
                statusBarBrightness: Brightness.dark),
            elevation: 0,
            backgroundColor: navyBlueColor,
            centerTitle: true,
            title: const Text(
              "My Profile",
              style: TextStyle(
                  color: whiteColor, fontSize: 18, fontWeight: FontWeight.w700),
            ),
            leadingWidth: 80,
            leading: widget.isEditProfile
                ? Padding(
                    padding: const EdgeInsets.only(left: 24, top: 5, bottom: 5),
                    child: CircleBack_Button(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                : null,
          ),
          body: Column(
            children: [
              Container(
                width: size.width,
                height: 180,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                  color: navyBlueColor,
                ),
                child: Center(
                  child: Container(
                    width: 126,
                    height: 125,
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [
                          Color(0xFF002F60),
                          Color(0xFF8E924B),
                          Color(0xFFEAD23E),
                        ], begin: Alignment.topRight, end: Alignment.topLeft)),
                    child: Stack(
                      fit: StackFit.expand,
                      clipBehavior: Clip.none,
                      children: [
                        const Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            radius: 100,
                            backgroundColor: navyBlueColor,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: ShowImageWidget(
                            image: image,
                            avatar: user!.image,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => bottomSheet(context),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.all(1),
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: navyBlueColor),
                              width: 40,
                              height: 40,
                              child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Image.asset(
                                      "assets/images/editicon.png")),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          const Text(
                            "First Name",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: darkBlueColor),
                          ),
                          SizedBox(
                            height: size.height * 0.012,
                          ),
                          TextFormField(
                            initialValue: user.firstName,
                            decoration: InputDecoration(
                                filled: true,
                                hintText: "First Name",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade500),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: navyBlueColor, width: 2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: lightGreyColor, width: 2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                fillColor: lightColor,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                )),
                            validator:
                                ref.read(validatorsProvider).validateName,
                            onSaved: (v) => ref
                                .read(updateUserNotifierProvider.notifier)
                                .updateFormData("first_name", v),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          const Text(
                            "Second Name",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: darkBlueColor),
                          ),
                          SizedBox(
                            height: size.height * 0.012,
                          ),
                          TextFormField(
                            initialValue: user.lastName,
                            decoration: InputDecoration(
                                filled: true,
                                hintText: "Second Name",
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: navyBlueColor, width: 2),
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade500),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: lightGreyColor, width: 2),
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                fillColor: lightColor,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                )),
                            validator:
                                ref.read(validatorsProvider).validateName,
                            onSaved: (v) => ref
                                .read(updateUserNotifierProvider.notifier)
                                .updateFormData("last_name", v),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          const Text(
                            "Phone Number",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: darkBlueColor),
                          ),
                          SizedBox(
                            height: size.height * 0.012,
                          ),
                          TextFormField(
                            initialValue: user.phone,
                            // textAlignVertical: TextAlignVertical.center,
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
                                      //Optional. Shows phone code before the country name.
                                      showPhoneCode: true,

                                      onSelect: (Country country) {
                                        setState(() {
                                          countryFlag = country.flagEmoji;
                                          countryCode = country.phoneCode;
                                        });
                                      },
                                      // Optional. Sets the theme for the country list picker.
                                      countryListTheme: CountryListThemeData(
                                        // Optional. Sets the border radius for the bottomsheet.
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
                                              color: darkSilverColor
                                                  .withOpacity(0.2),
                                            ),
                                          ),
                                        ),
                                        // Optional. Styles the text in the search field
                                        searchTextStyle: const TextStyle(
                                          color: Colors.blue,
                                          fontSize: 18,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              height: 24,
                                              width: 24,
                                              child: FittedBox(
                                                  fit: BoxFit.cover,
                                                  child: Text(
                                                    countryFlag,
                                                    style: const TextStyle(
                                                        fontSize: 16),
                                                  ))),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          Image.asset(
                                              "assets/images/dropdownicon.png"),
                                          const SizedBox(
                                            width: 9,
                                          ),
                                          Text(
                                            countryCode,
                                            style: const TextStyle(
                                                color: darkBlueColor),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                        ]),
                                  ),
                                ),
                                suffixIcon: textLength > 0
                                    ? Image.asset("assets/images/greentick.png")
                                    : null,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: navyBlueColor, width: 2),
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade500),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: lightGreyColor, width: 2),
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                fillColor: lightColor,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                )),
                            validator: ref.read(validatorsProvider).validatePhone,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          CustomButton(
                              title: user.firstName != null
                                  ? "Save Changes"
                                  : "Save",
                              onPressed: () {
                                debugPrint('hir');
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  final userId = ref.read(userProvider)!.id;
                                  ref
                                      .read(updateUserNotifierProvider.notifier)
                                      .updateUser(userId!);
                                }
                              })
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          const Text(
            "Choose Profile Photo",
            style: TextStyle(
                // color: Color(0xFF010317),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  getPicker(ImageSource.gallery);
                  Navigator.pop(context);
                },
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(Icons.image),
                      Text(
                        "Gallery",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 70,
              ),
              GestureDetector(
                onTap: () {
                  getPicker(ImageSource.camera);
                  Navigator.pop(context);
                },
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(Icons.camera),
                      Text(
                        "Camera",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ShowImageWidget extends StatelessWidget {
  final XFile? image;
  final String? avatar;

  const ShowImageWidget({super.key, this.image, this.avatar});

  @override
  Widget build(BuildContext context) {
    if (avatar != null && image == null) {
      debugPrint("avatar====>$avatar");
      return ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(55)),
          child: Image.network(
            avatar!,
            fit: BoxFit.cover,
          ));
    } else if (image != null) {
      return CircleAvatar(
          radius: 55, backgroundImage: FileImage(File(image!.path)));
    } else {
      return const CircleAvatar(
        radius: 55,
        backgroundImage: AssetImage("assets/images/profilepic.png"),
      );
    }
  }
}
