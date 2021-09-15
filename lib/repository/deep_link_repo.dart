import 'package:counter_app/models/post.dart';

enum LinkType { podcast, radio, notSupported }

List<Post> gottenPosts = [
  Post(
      type: LinkType.podcast,
      title: 'The google controller',
      id: 129304,
      text: 'this is the google controller'),
  Post(
      type: LinkType.radio,
      title: 'Nude man dances for his life at google headquarters',
      id: 124004,
      text:
          'This story was brought to you the good named google controller name'),
  Post(
      type: LinkType.podcast,
      title:
          'the apple naem controller google the snap apps controller controlled',
      id: 689304,
      text:
          'i dont know google or teh controller types google the name controller gogle '),
];

abstract class LinksRepository {
  Post getPostById(int id);
  int getPostId(String link);
}

class LinksImpl extends LinksRepository {
  // @override
  // LinkType getLinkType(String link) {
  //   var _linkType = link.substring(26, 27);
  //   switch (_linkType) {
  //     case "p":
  //       return LinkType.podcast;
  //       break;
  //     case "r":
  //       return LinkType.radio;
  //       break;
  //     default:
  //       return LinkType.notSupported;
  //   }
  // }

  @override
  Post getPostById(int id) {
    Post _post;
    for (var post in gottenPosts) {
      if (post.id == id) {
        _post = post;
      }
    }
    return _post;
  }

  @override
  int getPostId(String link) {
    var _id = link.substring(28, 34);

    return int.parse(_id);
  }
}
