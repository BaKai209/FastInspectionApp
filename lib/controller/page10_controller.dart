

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:signature/signature.dart';

final pointProvider = StateProvider<List<Point>>((ref) {
  return [];
});