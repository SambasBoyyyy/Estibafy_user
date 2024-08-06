import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../utils/constants.dart';

String verificationID = '';

class FirebasePhoneAuth {
  Future<bool> sendSms(String phoneNumber) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          verificationID = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      return true;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      if (e.code == 'invalid-verification-code') {
        K.showToast(message: 'Invalid Code try again!');
        return false;
      } else {
        EasyLoading.dismiss();
        K.showToast(message: '$e');
        return false;
      }
    }
  }

  Future<bool> verifyPhone(
    smsCode,
  ) async {
    EasyLoading.show();
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: smsCode);
    try {
      final result =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (result != null) {
        EasyLoading.dismiss();
        return true;
      }
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      if (e.code == 'invalid-verification-code') {
        K.showToast(message: 'Invalid Code try again!');
      } else {
        EasyLoading.dismiss();
        K.showToast(message: '$e');
      }
    } catch (e) {
      EasyLoading.dismiss();
      K.showToast(message: '$e');
    }
    return false;
  }
}
