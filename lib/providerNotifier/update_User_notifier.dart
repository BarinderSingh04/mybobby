
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mybobby/Services/authServices.dart';
import 'package:mybobby/models/getUser.dart';

final updateUserNotifierProvider =
    StateNotifierProvider.autoDispose<UpdateUserNotifier, AsyncValue<GetUser?>>(
        (ref) {
  return UpdateUserNotifier(ref.watch(authServiceProvider));
});

class UpdateUserNotifier extends StateNotifier<AsyncValue<GetUser?>> {
  final AuthService _authService;
  final Map<String, dynamic> _formData = {};

  UpdateUserNotifier(this._authService) : super(const AsyncValue.data(null));

  Future<void> updateUser(String userId) async {
    try {
      state = const AsyncValue.loading();
      _formData["id"] = userId;
      final updateProfile = await _authService.updateUser(_formData);
      state = AsyncValue.data(updateProfile);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void onImageSaved(String key, dynamic value) async {
    if (value is XFile) {
      final file = File(value.path);
      _formData[key] = await MultipartFile.fromFile(
        file.path,
        filename: file.toString().split("/").last,
      );
      debugPrint("file===>${file.path}");
    }
  }

  void updateFormData(String key, String? value) {
    _formData[key] = value!.trim();
  }
}



