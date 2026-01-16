import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list/data/post.dart';
import 'package:infinite_list/screens/bloc/infinite_list_event.dart';
import 'package:infinite_list/screens/bloc/infinite_list_state.dart';
import 'package:infinite_list/screens/bloc/infinite_list_status.dart';
import 'package:infinite_list/utils/event_transformer.dart';

class InfiniteListBloc extends Bloc<InfiniteListEvent, InfiniteListState> {
  InfiniteListBloc() : super(const InfiniteListState()) {
    on<ListFetched>(
      _onListFetched,
      transformer: throttleDroppable(const Duration(milliseconds: 100)),
    );
  }

  void _onListFetched(
    ListFetched event,
    Emitter<InfiniteListState> emit,
  ) async {
    if (state.hasReachedMax) return;

    try {
      final posts = await _getPosts(startIndex: state.posts.length);
      emit(
        state.copyWith(
          status: InfiniteListStatus.success,
          posts: List.of(state.posts)..addAll(posts),
          hasReachedMax: posts.isEmpty,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: InfiniteListStatus.failure));
    }
  }

  Future<List<Post>> _getPosts({required int startIndex}) async {
    final url = Uri.https('jsonplaceholder.typicode.com', '/posts', {
      '_start': '$startIndex',
      '_limit': '20',
    });
    final response = await http.get(url);
    final List<dynamic> rawData = jsonDecode(response.body);
    final List<Post> posts = rawData
        .map((json) => Post.fromJson(json))
        .toList();
    return posts;
  }
}
