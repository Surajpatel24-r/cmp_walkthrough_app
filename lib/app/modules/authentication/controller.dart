// // ignore_for_file: unnecessary_null_comparison, unused_field
// ignore_for_file: unnecessary_null_comparison, unused_field

import 'package:cmp_walkthrough_app/app/data/models/userDataModel.dart';
import 'package:cmp_walkthrough_app/app/modules/authentication/views/onboarding.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/userModel.dart';
import '../../data/providers/firebase_provider.dart';
import '../../data/providers/storage_provider.dart';
import '../home/view.dart';

class AuthScreenController extends GetxController {
  final FirebaseProvider _firebaseProvider = FirebaseProvider();
  final _storageProvider = StorageProvider();

  UserModel? user;
  UserDataModel? userDataModel;

  final loginFormKey = GlobalKey<FormState>();
  final otpFormKey = GlobalKey<FormState>();
  final onboardingFormKey = GlobalKey<FormState>();

  //mobile auth
  final numberEditingController = TextEditingController();
  final otpEditingController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  // Setter Getter
  var isLoading = false.obs;
  void setLoading(bool value) {
    isLoading.value = value;
  }

  void initTextEditingController() {
    fullNameController = TextEditingController();
    emailController = TextEditingController();

    fullNameController.text = userDataModel!.fullName ?? '';
    emailController.text = userDataModel!.email ?? '';
  }

  void disposeTextEditingController() {
    fullNameController.dispose();
    emailController.dispose();
  }

  Rx<Country> selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  ).obs;

  void onSelectCountry(Country country) {
    selectedCountry.value = country;
  }

  void phoneNumberAuthentication() async {
    isLoading.value = true;
    String mobile = numberEditingController.text;
    if (mobile == "") {
      isLoading.value = false;
      Get.snackbar(
        "Please enter the mobile number!",
        "Failed",
      );
    } else {
      _firebaseProvider
          .verifyPhoneNumber("+${selectedCountry.value.phoneCode}$mobile");
      isLoading.value = false;
    }
    isLoading.value = false;
  }

  // void otpVerificationAndLogin() {
  //   String? otpCode = otpEditingController.text;
  //   final String verificationId = Get.arguments[0];
  //   setLoading(true);
  //   if (otpCode != null) {
  //     _firebaseProvider.verifyOtp(verificationId, otpCode);
  //     setLoading(false);
  //   } else {
  //     Get.snackbar(
  //       "Enter 6-Digit code",
  //       "Failed",
  //     );
  //     setLoading(false);
  //   }
  //   setLoading(false);
  // }

  void otpVerificationAndLogin(String otpCode) async {
    var isVerified = await _firebaseProvider.verifyOtp(otpCode);
    isVerified ? Get.offAll(() => OnboardingScreen()) : Get.back();
  }

  void postAllDatas() async {
    print(fullNameController.text);
    print(emailController.text);

    setLoading(true);
    if (fullNameController.text.isNotEmpty && emailController.text.isNotEmpty) {
      try {
        user = await _storageProvider.readUserModel();

        final success =
            await _firebaseProvider.uploadDataToFirebase(UserDataModel(
          fullName: fullNameController.text.isEmpty
              ? null
              : fullNameController.text.trim(),
          email:
              emailController.text.isEmpty ? null : emailController.text.trim(),
        ));

        if (success) {
          Get.snackbar('Uploaded Successfully', "Uploaded Successfully");
          setLoading(false);
          await Future.delayed(
            Duration(seconds: 1),
            () {
              Get.off(() => HomeScreen());
            },
          );
          fullNameController.clear();
          emailController.clear();
        } else {
          setLoading(false);
        }
      } catch (e) {
        Get.snackbar(
          'Upload Error',
          'Failed to upload the email. Please try again.',
          snackPosition: SnackPosition.TOP,
        );
        print('Exception during video upload: $e');
      }
    } else {
      Get.snackbar(
        'Upload Error',
        'email, text or category and location file is missing.',
        snackPosition: SnackPosition.TOP,
      );
      print('Email and fullname file is missing.');
    }
  }

  @override
  void dispose() {
    numberEditingController.dispose();
    otpEditingController.dispose();
    fullNameController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
