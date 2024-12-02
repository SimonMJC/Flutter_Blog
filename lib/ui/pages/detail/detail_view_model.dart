import 'dart:async';

import 'package:blog/data/model/post.dart';
import 'package:blog/data/repository/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 사실상 상태가 현재는 없지만 Post로!!
// 2. 뷰모델 만들기. 포스트 지울 때 id 필요하니
class DetailViewModel extends AutoDisposeFamilyNotifier<Post?, Post> {
  @override
  Post? build(Post? arg) {
    return arg;
  }

  final postRepository = const PostRepository();

  Future<bool> delete() async {
    return await postRepository.delete(arg.id);
  }

  void listenStream() async {
    final streamSubscription = postRepository.postStream(arg.id).listen(
      (post) {
        state = post;
      },
    );
    ref.onDispose(
      () {
        print("DISPOSE 됨");
        streamSubscription.cancel();
      },
    );
  }
}

// 3. 뷰모델 관리자!
final detailViewModel =
    NotifierProvider.autoDispose.family<DetailViewModel, Post?, Post>(
  () => DetailViewModel(),
);
