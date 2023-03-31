import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mybobby/Services/authServices.dart';
import 'package:mybobby/models/getUser.dart';

final getUserNotifierProvider =
StateNotifierProvider.autoDispose<GetUserNotifier, AsyncValue<GetUser?>>(
        (ref) {
      return GetUserNotifier(ref.watch(authServiceProvider));
    });

class GetUserNotifier extends StateNotifier<AsyncValue<GetUser?>> {
  final AuthService _authService;
  final Map<String, dynamic> _formData = {};

  GetUserNotifier(this._authService) : super(const AsyncValue.data(null));

  Future<void> getUser() async {
    try {
      state = const AsyncValue.loading();
      final String id = _formData['id'];
      final getProfile = await _authService.getUser(id);
      state =  AsyncValue.data(getProfile);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
  void updateFormData(String key, String? value) {
    _formData[key] = value!.trim();
  }
}