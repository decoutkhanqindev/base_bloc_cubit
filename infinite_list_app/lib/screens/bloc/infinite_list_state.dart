import 'package:equatable/equatable.dart';
import 'package:infinite_list/data/post.dart';
import 'package:infinite_list/screens/bloc/infinite_list_status.dart';

final class InfiniteListState extends Equatable {
  final InfiniteListStatus status;
  final List<Post> posts;
  final bool hasReachedMax;

  const InfiniteListState({
    this.status = InfiniteListStatus.initial,
    this.posts = const [],
    this.hasReachedMax = false,
  });

  InfiniteListState copyWith({
    InfiniteListStatus? status,
    List<Post>? posts,
    bool? hasReachedMax,
  }) => InfiniteListState(
    status: status ?? this.status,
    posts: posts ?? this.posts,
    hasReachedMax: hasReachedMax ?? this.hasReachedMax,
  );

  @override
  List<Object?> get props => [status, posts, hasReachedMax];
}
