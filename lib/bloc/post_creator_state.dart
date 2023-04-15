abstract class PostCreatorState {}

class ProgressBar extends PostCreatorState {}

class PostsCreated extends PostCreatorState {
  PostsCreated(this.textList);

  final List<String> textList;
}

class PostsSaved extends PostCreatorState {}

class PostCreatorException extends PostCreatorState {}
