import 'package:counter_app/repository/deep_link_repo.dart';

class Post {
  final String title;
  final int id;
  final String text;
  final LinkType type;

  const Post({this.id, this.text, this.title, this.type});
}
