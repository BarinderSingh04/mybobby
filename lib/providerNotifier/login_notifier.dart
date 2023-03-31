import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mybobby/Services/authServices.dart';
import 'package:mybobby/models/getUser.dart';


final loginNotifierProvider =
    StateNotifierProvider.autoDispose<LoginNotifier, AsyncValue<AuthState?>>(
        (ref) {
  return LoginNotifier(ref.watch(authServiceProvider));
});

class LoginNotifier extends StateNotifier<AsyncValue<AuthState?>> {
  final AuthService _authService;
  String? phone;
  String? otp;

  LoginNotifier(this._authService) : super(const AsyncValue.data(null));

  Future<void> login() async {
    try {
      state = const AsyncValue.loading();
      await _authService.userLogin(phone!);
      state = AsyncValue.data(AuthState(response: "OtpSent"));
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> verifyOtp() async {
    try {
      state = const AsyncValue.loading();
      final user = await _authService.verificationOtp(phone!, otp!);
      state = AsyncValue.data(AuthState(response: "OtpVerified",user: user));
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      debugPrint('state==Error=>$state');
    }
  }

  void updatePhone(String? phone){
    this.phone = phone;
  }

  void updateOtp(String? otp){
    this.otp = otp;
  }

}


class AuthState {
  GetUser? user;
  String? response;

  AuthState({this.user, this.response});
}