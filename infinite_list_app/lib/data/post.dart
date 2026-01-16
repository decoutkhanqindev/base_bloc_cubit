import 'package:equatable/equatable.dart';

final class Post extends Equatable {
  final int id;
  final String title;
  final String body;

  const Post({required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) =>
      Post(id: json['id'], title: json['title'], body: json['body']);

  @override
  List<Object?> get props => [id, title, body];
}
