import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_detail.dart';
import '../services/auth_services.dart';

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
      await _authService.login(phone!);
      state = AsyncValue.data(AuthState(event: AuthEvent.otpSent));
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> verifyOtp() async {
    try {
      state = const AsyncValue.loading();
      final user = await _authService.verificationOtp(phone!, otp!);
      state = AsyncValue.data(AuthState(event: AuthEvent.verified, user: user));
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void updatePhone(String? phone) {
    this.phone = phone;
  }

  void updateOtp(String? otp) {
    this.otp = otp;
  }
}

class AuthState {
  UserDetail? user;
  AuthEvent? event;
  AuthState({this.user, this.event});
}

enum AuthEvent {
  otpSent,
  verified,
}
