part of 'answers_bloc.dart';

@immutable
abstract class AnswersEvent {
  const AnswersEvent();
}

class AnswersInitSet extends AnswersEvent {
  const AnswersInitSet(this.questionId, this.question);

  final String questionId;
  final String question;

  @override
  String toString() => 'AnswersInitSet {}';
}

class AnswersIsLoadingSet extends AnswersEvent {
  const AnswersIsLoadingSet({
    this.isLoading = true,
  });

  final bool isLoading;

  @override
  String toString() => 'AnswersIsLoadingSet {}';
}

class AnswersIsVoteLoadingSet extends AnswersEvent {
  const AnswersIsVoteLoadingSet({
    this.isVoteLoading = true,
  });

  final bool isVoteLoading;

  @override
  String toString() => 'AnswersIsVoteLoadingSet {}';
}

class AnswersQuestionGet extends AnswersEvent {
  const AnswersQuestionGet();

  @override
  String toString() => 'AnswersQuestionGet {}';
}

class AnswersQuestionSet extends AnswersEvent {
  const AnswersQuestionSet(this.questionId, this.question);

  final String questionId;
  final Question? question;

  @override
  String toString() => 'AnswersQuestionSet {}';
}

class AnswersSelectedAnswerSet extends AnswersEvent {
  const AnswersSelectedAnswerSet(this.answerId);

  final String answerId;

  @override
  String toString() => 'AnswersSelectedAnswerSet {}';
}

class AnswersNewFilesPick extends AnswersEvent {
  const AnswersNewFilesPick();

  @override
  String toString() => 'AnswersNewFilesPick {}';
}

class AnswersFileDelete extends AnswersEvent {
  const AnswersFileDelete(this.index, this.key);

  final int index;
  final String key;

  @override
  String toString() => 'AnswersFileDelete {}';
}

class AnswersAnswerUpvote extends AnswersEvent {
  const AnswersAnswerUpvote(this.index, this.answerId);

  final int index;
  final String answerId;

  @override
  String toString() => 'AnswersAnswerUpvote {}';
}

class AnswersAnswerDownvote extends AnswersEvent {
  const AnswersAnswerDownvote(this.index, this.answerId, this.answerVoteId);

  final int index;
  final String answerId;
  final String answerVoteId;

  @override
  String toString() => 'AnswersAnswerDownvote {}';
}

class AnswersAnswerCreate extends AnswersEvent {
  const AnswersAnswerCreate(this.groupId, this.questionId, this.answerName);

  final String groupId;
  final String questionId;
  final String answerName;

  @override
  String toString() => 'AnswersAnswerCreate {}';
}

class AnswersNewAnswerFilesCreate extends AnswersEvent {
  const AnswersNewAnswerFilesCreate(this.answerId);

  final String answerId;

  @override
  String toString() => 'AnswersNewAnswerFilesCreate {}';
}

class AnswersAnswerDelete extends AnswersEvent {
  const AnswersAnswerDelete(this.answerId, this.questionId);

  final String answerId;
  final String questionId;

  @override
  String toString() => 'AnswersAnswerDelete {}';
}

class AnswersAllAnswersGet extends AnswersEvent {
  const AnswersAllAnswersGet();

  @override
  String toString() => 'AnswersAllAnswersGet {}';
}

class AnswersSearchTextSet extends AnswersEvent {
  const AnswersSearchTextSet(this.searchText);

  final String searchText;

  @override
  String toString() => 'AnswersSearchTextSet {}';
}

class AnswersShowHeaderSearchBarSet extends AnswersEvent {
  const AnswersShowHeaderSearchBarSet({this.showHeaderSearchBar = false});

  final bool showHeaderSearchBar;

  @override
  String toString() => 'AnswersShowHeaderSearchBarSet {}';
}

class AnswersAnswersSearch extends AnswersEvent {
  const AnswersAnswersSearch(this.questionId, this.searchTerm);

  final String questionId;
  final String searchTerm;

  @override
  String toString() => 'AnswersAnswersSearch {}';
}

class AnswersCreateAnswerStreamSubscribe extends AnswersEvent {
  const AnswersCreateAnswerStreamSubscribe();

  @override
  String toString() => 'AnswersCreateAnswerStreamSubscribe {}';
}

class AnswersUpdateAnswerStreamSubscribe extends AnswersEvent {
  const AnswersUpdateAnswerStreamSubscribe();

  @override
  String toString() => 'AnswersUpdateAnswerStreamSubscribe {}';
}

class AnswersCreateAnswerStreamUnsubscribe extends AnswersEvent {
  const AnswersCreateAnswerStreamUnsubscribe();

  @override
  String toString() => 'AnswersCreateAnswerStreamUnsubscribe {}';
}

class AnswersUpdateAnswerStreamUnsubscribe extends AnswersEvent {
  const AnswersUpdateAnswerStreamUnsubscribe();

  @override
  String toString() => 'AnswersUpdateAnswerStreamUnsubscribe {}';
}

class AnswersUserReport extends AnswersEvent {
  const AnswersUserReport(this.userId, this.name, this.description);

  final String userId;
  final String name;
  final String description;

  @override
  String toString() => 'AnswersUserReport {}';
}
