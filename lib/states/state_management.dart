import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/cores/api_utils.dart';
import 'package:learn_riverpod/models/photo_model.dart';

final photoStateFutureProvider = FutureProvider<List<PhotoModel>>((ref) async {
  return fetchPhotos();
});
