import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AvatarService {
  final _storage = FirebaseStorage.instance;
  final _auth = FirebaseAuth.instance;

  Future<void> uploadAvatar(File imageFile) async {
    final user = _auth.currentUser;
    if (user != null) {
      final ref = _storage.ref().child('avatars').child(user.uid);
      await ref.putFile(imageFile);
    }
  }

  Future<String?> getAvatarUrl() async {
    final user = _auth.currentUser;
    if (user != null) {
      final ref = _storage.ref().child('avatars').child(user.uid);
      try {
        final url = await ref.getDownloadURL();
        return url;
      } catch (e) {
        print('Error getting avatar URL: $e');
      }
    }
    return null;
  }

  Future<void> updateAvatar(File newImageFile) async {
    await uploadAvatar(newImageFile);
  }
}
