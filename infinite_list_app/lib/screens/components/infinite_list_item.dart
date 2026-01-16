import 'package:flutter/material.dart';
import 'package:infinite_list/data/post.dart';

class InfiniteListItem extends StatelessWidget {
  final Post post;

  const InfiniteListItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: Text('${post.id}', style: textTheme.bodySmall),
      title: Text(post.title, style: textTheme.bodyMedium),
      isThreeLine: true,
      subtitle: Text(post.body, style: textTheme.bodySmall),
      dense: true,
    );
  }
}
