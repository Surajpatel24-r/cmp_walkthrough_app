// ignore_for_file: unused_field, unnecessary_null_comparison

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmp_walkthrough_app/app/data/models/userDataModel.dart';
import 'package:cmp_walkthrough_app/app/modules/authentication/views/otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../core/values/keys.dart';
import '../models/userModel.dart';

class FirebaseProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  var verificationId = ''.obs;

  // Phone Number Authentication
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        // verificationCompleted: (PhoneAuthCredential credential) async {
        //   await _firebaseAuth.signInWithCredential(credential);
        // },
        verificationCompleted: (credential) async {
          await _firebaseAuth.signInWithCredential(credential);
        },
        // codeSent: (String verificationId, int? resendToken) async {
        //   String smsCode = ''; // get sms code from user
        //   PhoneAuthCredential credential = PhoneAuthProvider.credential(
        //     verificationId: verificationId,
        //     smsCode: smsCode,
        //   );
        //   Get.to(
        //       OtpScreen(
        //         formattedPhoneNumber: formatPhoneNumber(phoneNumber),
        //       ),
        //       arguments: [verificationId]);
        //   _firebaseAuth.signInWithCredential(credential);
        // },
        codeSent: (verificationId, resendToken) async {
          this.verificationId.value = verificationId;
          Get.to(
              OtpScreen(
                formattedPhoneNumber: formatPhoneNumber(phoneNumber),
              ),
              arguments: [verificationId]);
        },
        // codeAutoRetrievalTimeout: (String verificationId) {},
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        },
        // verificationFailed: (FirebaseAuthException e) {
        //   Get.snackbar("Error", "Verification failed: ${e.message}");
        //   print("Verification failed: ${e.message}");
        // },
        verificationFailed: (e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar('Error', 'This provided phone number is not valid.',
                snackPosition: SnackPosition.TOP);
          } else {
            Get.snackbar("Error", "Somthing Went Wrong. Try again.",
                snackPosition: SnackPosition.TOP);
          }
        },
      );
    } catch (e) {
      Get.snackbar("An error occurred while verifying the phone number.", "");
    }
  }

  String formatPhoneNumber(String phoneNumber) {
    String numericOnly = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
    String lastFourDigits = numericOnly.substring(numericOnly.length - 4);
    return "XXXXXX" + lastFourDigits;
  }

// // verify otp
//   Future<void> verifyOtp(String verificationId, String userOtp) async {
//     try {
//       PhoneAuthCredential creds = PhoneAuthProvider.credential(
//           verificationId: verificationId, smsCode: userOtp);
//       User? user = (await _firebaseAuth.signInWithCredential(creds)).user;
//       if (user != null) {
//         Get.off(() => OnboardingScreen());
//       } else {
//         Get.snackbar(
//           "Authentication failed",
//           "Failed",
//         );
//       }
//     } on FirebaseAuthException catch (e) {
//       Get.snackbar(
//         e.message.toString(),
//         "Failed",
//       );
//     }
//   }

// verify otp
  Future<bool> verifyOtp(String userOtp) async {
    var credentials = await _firebaseAuth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: userOtp));
    return credentials.user != null ? true : false;
  }

  // user data show
  Future<void> uploadUserData(UserModel userModel) async {
    try {
      final CollectionReference usersCollection =
          _firestore.collection('users');
      await usersCollection.doc(userModel.uid).set(userModel.toJson());
    } catch (e) {
      print('Error saving user data to Firestore: $e');
      throw e;
    }
  }

  // video upload to firebase
  Future<bool> uploadDataToFirebase(UserDataModel updatedUser) async {
    var check = true;
    // UserModel user = await _storageProvider.readUserModel();
    try {
      CollectionReference datasCollection =
          _firestore.collection(KeysConstant.datas);
      // for unique videos collection setup
      final alldocs = await datasCollection.get();
      print(alldocs.docs.length);
      var len = 0;
      if (alldocs.docs.length != 0) {
        final last = alldocs.docs.last;
        len = int.parse((last.data() as Map<String, dynamic>)['docId']) + 1;
        print(len);
      }
      DocumentReference doc = datasCollection.doc(len.toString());
      // updatedUser.copyWith(docId: len.toString());
      await doc
          .set(updatedUser.copyWith(docId: len.toString()).toJson())
          .timeout(Duration(seconds: 5), onTimeout: () {
        check = false;
      });
      return check;
    } catch (e) {
      print(e.toString());
      Get.snackbar("Error", e.toString());
      return false;
    }
  }
}
