import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list/screens/bloc/infinite_list_bloc.dart';
import 'package:infinite_list/screens/bloc/infinite_list_event.dart';
import 'package:infinite_list/screens/bloc/infinite_list_state.dart';
import 'package:infinite_list/screens/bloc/infinite_list_status.dart';
import 'package:infinite_list/screens/components/infinite_list_bottom_loader.dart';
import 'package:infinite_list/screens/components/infinite_list_item.dart';

class InfiniteListBody extends StatefulWidget {
  const InfiniteListBody({super.key});

  @override
  State<InfiniteListBody> createState() => _InfiniteListBodyState();
}

class _InfiniteListBodyState extends State<InfiniteListBody> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfiniteListBloc, InfiniteListState>(
      builder: (context, state) => _buildBody(state),
    );
  }

  Widget _buildBody(InfiniteListState state) {
    return switch (state.status) {
      InfiniteListStatus.initial => const Placeholder(),
      InfiniteListStatus.success => _buildList(state),
      InfiniteListStatus.failure => const Center(
        child: Text('Something went wrong!'),
      ),
    };
  }

  Widget _buildList(InfiniteListState state) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return index >= state.posts.length
            ? const InfiniteListBottomLoader()
            : InfiniteListItem(post: state.posts[index]);
      },
      itemCount: state.hasReachedMax
          ? state.posts.length
          : state.posts.length + 1,
      controller: _scrollController,
    );
  }

  void _onScroll() {
    if (_isBottom) context.read<InfiniteListBloc>().add(GetList());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
