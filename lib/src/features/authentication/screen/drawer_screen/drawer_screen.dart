import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/controllers/drawer_controller.dart';
import 'package:Go1Tok/src/features/authentication/models/user_model.dart';
import 'package:Go1Tok/src/features/authentication/screen/login/login_screen.dart';
import 'package:Go1Tok/src/features/authentication/screen/settings/settings_screen.dart';
import 'package:Go1Tok/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../constants/image_strings.dart';
import 'drawer_icon.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final authController = Get.put(AuthenticationRepository());

  final drawerController = Get.put(DrawerControllers());

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: Helper.screenWidth(),
      color: tPrimaryColor,
      child: Padding(
          padding: const EdgeInsets.only(
              top: tDefaultSize + 20,
              left: tDefaultSize - 20,
              bottom: tDefaultSize + 40),
          child: authController.getUserID
              .toString()
              .isEmpty
              ? Row(
            children: [
              Column(
                children: [
                  const SizedBox(
                    width: tLargeSpace,
                  ),
                  Text(
                    tPleaseLogin,
                    style: Theme.of(context).textTheme.titleMedium?.apply(
                      color: tWhiteColor,
                    )
                  ),
                  const SizedBox(
                    height: tLargeSpace,
                  ),
                  SizedBox(
                    width: 200,
                    //height: 100,
                    child: OutlinedButton(
                        onPressed: () {
                          Get.offAll(() => const LoginScreen());
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: tWhiteColor,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(tLargeWidth)),
                        ),
                        child:  Text(tLogin,
                            style: Theme.of(context).textTheme.titleMedium?.apply(
                              color: tDarkColor,
                              fontStyle: FontStyle.normal,
                            ),
                        ),
                        ),
                  ),
                ],
              ),
            ],
          )
              : FutureBuilder(
              future: drawerController.getInfo(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.data != null) {
                  if (snapshot.hasData) {
                    UserModel userData = snapshot.data as UserModel;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                showAnimatedDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext context) {
                                    return ClassicGeneralDialogWidget(
                                      titleText: tContinueWith,
                                      contentText: tSelectFrom,
                                      positiveText: tPickFromCamera,
                                      negativeText: tPickFromGallery,
                                      positiveTextStyle: Theme.of(context).textTheme.bodyMedium,

                                      negativeTextStyle: Theme.of(context).textTheme.bodyMedium,
                                      onPositiveClick: () {
                                       //Navigator.of(context).pop();
                                        drawerController.pickImage(
                                            ImageSource.camera,
                                            userData.id,
                                            context);
                                        //Navigator.of(context).pop();
                                      },
                                      onNegativeClick: () {
                                       // Navigator.of(context).pop();
                                        drawerController.pickImage(
                                            ImageSource.gallery,
                                            userData.id,
                                            context);
                                        //Navigator.of(context).pop();
                                      },
                                    );
                                  },
                                  animationType: DialogTransitionType.rotate3D,
                                  curve: Curves.fastOutSlowIn,
                                  duration: const Duration(seconds: 1),

                                );

                              },
                              child: CircleAvatar(
                                //minRadius: 30,
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(tDefaultRadius),
                                  child: (drawerController
                                      .drawerImage.isEmpty &&
                                      userData.imageUrl.isEmpty)
                                      ? const Image(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          tUserImage1)

                                  ) : drawerController.drawerImage.isNotEmpty
                                      ? Image.network(
                                      userData.imageUrl)
                                      : Image.network(
                                      userData.imageUrl),


                                ),
                              ),
                            ),
                            const SizedBox(
                              width: tDefaultSpace - 10.0,
                            ),
                            Column(
                              children: [
                                Text(
                                  "${userData.firstName} ${userData.lastName}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: tWhiteColor,
                                    fontSize: tDefaultLargeFontSize,
                                    decoration: TextDecoration.none,
                                  ),
                                  // textAlign: TextAlign.start,
                                ),
                                const SizedBox(
                                  height: tDefaultHeight - 10.0,
                                ),
                                Text(
                                  userData.email,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: tWhiteColor,
                                    fontSize: tDefaultFontSize,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                         Column(
                          children: [
                            DrawerIcon(
                              text: tMyProfile,
                              icon: LineAwesomeIcons.user_1,
                            ),
                            SizedBox(
                              height: tDefaultSpace,
                            ),

                            GestureDetector(
                              onTap: () => Get.to(() => const SettingsScreen()),
                              child: DrawerIcon(
                                text: tSettings,
                                icon: Icons.settings,
                              ),
                            ),

                            //Spacer(),
                            SizedBox(
                              height: tDefaultSpace,
                            ),
                            DrawerIcon(
                              text: tAboutUs,
                              icon: Icons.error_outline,
                            ),
                            SizedBox(
                              height: tDefaultSpace,
                            ),

                            DrawerIcon(
                              text: tContactUs,
                              icon: Icons.contact_support_outlined,
                            ),
                            SizedBox(
                              height: tDefaultSpace,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            authController.logOut(context);
                          },
                          child: Row(
                            children: [
                              const Icon(
                                LineAwesomeIcons.alternate_sign_out,
                                color: tWhiteColor,
                              ),
                              const SizedBox(
                                width: tDefaultSpace,
                              ),
                              Expanded(
                                child: Text(
                                  tLogOut,
                                  style: TextStyle(
                                    color: tWhiteColor.withOpacity(0.8),
                                    fontSize: tDefaultFontSize,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(snapshot.error.toString(),
                            style: const TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: tDefaultMediumFontSize)),
                      ],
                    );
                  } else {
                    return const Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Flexible(
                            child: Text(
                              tSomethingWentWrong,
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: tDefaultMediumFontSize),
                            )),
                      ],
                    );
                  }
                } else {

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Flexible(
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.white,
                          period: const Duration(milliseconds: 2500),
                          child: const Text(
                            tLoadingUserInfo,
                            style: TextStyle(
                              fontSize: tDefaultFontSize,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              })),
    );
  }



}
