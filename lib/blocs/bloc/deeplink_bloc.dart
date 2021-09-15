import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:counter_app/models/post.dart';
import 'package:counter_app/repository/deep_link_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:uni_links/uni_links.dart';
part 'deeplink_event.dart';
part 'deeplink_state.dart';

class DeeplinkBloc extends Bloc<DeeplinkEvent, DeeplinkState> {
  DeeplinkBloc(this.linksRepository) : super(DeeplinkInitial());

  final LinksRepository linksRepository;

  @override
  Stream<DeeplinkState> mapEventToState(
    DeeplinkEvent event,
  ) async* {
    if (event is GetInitialDeepLink) {
      yield* _mapGetInitialDeepLinkToState();
    }
  }

  Stream<DeeplinkState> _mapGetInitialDeepLinkToState() async* {
    try {
      String initialLink = await getInitialLink();
      if (initialLink != null) {
        int postId = linksRepository.getPostId(initialLink);

        Post gottenPost = linksRepository.getPostById(postId);
        yield InitialDeepLinkFound(post: gottenPost);
      } else {
        print("Error is: Link Is Null");
        yield DeepLinkError(error: Error());
      }
    } catch (error) {
      print("Error is: $error");
      yield DeepLinkError(error: error);
    }
  }
}

class GoogleController {
  GoogleController._();
  static String myString = 'https://open.podiobox.com/p/440590/';

  static void doSomeFilters() {
    var _linkType = myString.substring(26, 27);
    var _id = myString.substring(28, 34);
    print(_linkType);
    if (_linkType == 'p') {
      print('the link is a post with an id of $_id');
    } else if (_linkType == 'r') {
      print('the link is a radio station with an id of $_id');
    }
  }
}
