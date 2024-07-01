import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final writeViewModelProvider = AsyncNotifierProvider.autoDispose(
  () => WriteViewModel(),
);

class WriteViewModel extends AutoDisposeAsyncNotifier {
  @override
  FutureOr build() {}

  Future<void> uploadPost() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async => await Future.delayed(const Duration(seconds: 1)),
    );
  }
}
