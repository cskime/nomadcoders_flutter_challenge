import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/user/models/user_profile.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/user/repositories/users_repository.dart';

final searchViewModelProvider =
    AsyncNotifierProvider<SearchViewModel, List<UserProfile>>(
  () => SearchViewModel(),
);

class SearchViewModel extends AsyncNotifier<List<UserProfile>> {
  late final UsersRepositoryType _usersRepository;

  var _originalUsers = <UserProfile>[];

  @override
  FutureOr<List<UserProfile>> build() async {
    _usersRepository = ref.read(usersRepositoryProvider);
    _originalUsers = await _usersRepository.fetchProfiles();
    return _originalUsers;
  }

  Future<void> search({required String query}) async {
    state = const AsyncValue.loading();
    final filteredUsers = _originalUsers
        .where((user) => [user.username, user.name].contains(query))
        .toList();
    state = AsyncValue.data(filteredUsers);
  }
}
