part of 'questions_bloc.dart';

@immutable
abstract class QuestionsEvent {
  const QuestionsEvent();
}

class QuestionsInitSet extends QuestionsEvent {
  const QuestionsInitSet(this.questionId, this.question);

  final String questionId;
  final String question;

  @override
  String toString() => 'QuestionsInitSet {}';
}

class QuestionsIsLoadingSet extends QuestionsEvent {
  const QuestionsIsLoadingSet({
    this.isLoading = true,
  });

  final bool isLoading;

  @override
  String toString() => 'QuestionsIsLoadingSet {}';
}

class QuestionsIsSaveLoadingSet extends QuestionsEvent {
  const QuestionsIsSaveLoadingSet({
    this.isSaveLoading = true,
  });

  final bool isSaveLoading;

  @override
  String toString() => 'QuestionsIsSaveLoadingSet {}';
}

class QuestionsIsVoteLoadingSet extends QuestionsEvent {
  const QuestionsIsVoteLoadingSet({
    this.isVoteLoading = true,
  });

  final bool isVoteLoading;

  @override
  String toString() => 'QuestionsIsVoteLoadingSet {}';
}

class QuestionsNewQuestionNameSet extends QuestionsEvent {
  const QuestionsNewQuestionNameSet(this.newQuestionName);

  final String newQuestionName;

  @override
  String toString() => 'QuestionsNewQuestionNameSet {}';
}

class QuestionsNewQuestionGroupIdSet extends QuestionsEvent {
  const QuestionsNewQuestionGroupIdSet(this.newQuestionGroupId);

  final String newQuestionGroupId;

  @override
  String toString() => 'QuestionsNewQuestionGroupIdSet {}';
}

class QuestionsGroupGet extends QuestionsEvent {
  const QuestionsGroupGet();

  @override
  String toString() => 'QuestionsGroupGet {}';
}

class QuestionsGroupSet extends QuestionsEvent {
  const QuestionsGroupSet(this.groupId, this.group);

  final String groupId;
  final Group? group;

  @override
  String toString() => 'QuestionsGroupSet {}';
}

class QuestionsSelectedQuestionSet extends QuestionsEvent {
  const QuestionsSelectedQuestionSet(this.questionId);

  final String questionId;

  @override
  String toString() => 'QuestionsSelectedQuestionSet {}';
}

class QuestionsNewFilesPick extends QuestionsEvent {
  const QuestionsNewFilesPick();

  @override
  String toString() => 'QuestionsNewFilesPick {}';
}

class QuestionsFileDelete extends QuestionsEvent {
  const QuestionsFileDelete(this.index, this.key);

  final int index;
  final String key;

  @override
  String toString() => 'QuestionsFileDelete {}';
}

class QuestionsQuestionSave extends QuestionsEvent {
  const QuestionsQuestionSave(this.index, this.questionId);

  final int index;
  final String questionId;

  @override
  String toString() => 'QuestionsQuestionSave {}';
}

class QuestionsQuestionUnsave extends QuestionsEvent {
  const QuestionsQuestionUnsave(
    this.index,
    this.questionId,
    this.questionSaveId,
  );

  final int index;
  final String questionId;
  final String questionSaveId;

  @override
  String toString() => 'QuestionsQuestionUnsave {}';
}

class QuestionsQuestionUpvote extends QuestionsEvent {
  const QuestionsQuestionUpvote(this.index, this.questionId);

  final int index;
  final String questionId;

  @override
  String toString() => 'QuestionsQuestionUpvote {}';
}

class QuestionsQuestionDownvote extends QuestionsEvent {
  const QuestionsQuestionDownvote(
    this.index,
    this.questionId,
    this.questionVoteId,
  );

  final int index;
  final String questionId;
  final String questionVoteId;

  @override
  String toString() => 'QuestionsQuestionDownvote {}';
}

class QuestionsQuestionCreate extends QuestionsEvent {
  const QuestionsQuestionCreate(
    this.groupId,
    this.questionDescription,
    this.questionName,
  );

  final String groupId;
  final String questionDescription;
  final String questionName;

  @override
  String toString() => 'QuestionsQuestionCreate {}';
}

class QuestionsNewQuestionFilesCreate extends QuestionsEvent {
  const QuestionsNewQuestionFilesCreate(this.questionId);

  final String questionId;

  @override
  String toString() => 'QuestionsNewQuestionFilesCreate {}';
}

class QuestionsQuestionDelete extends QuestionsEvent {
  const QuestionsQuestionDelete(
    this.groupId,
    this.questionId,
  );

  final String groupId;
  final String questionId;

  @override
  String toString() => 'QuestionsQuestionDelete {}';
}

class QuestionsAllQuestionsGet extends QuestionsEvent {
  const QuestionsAllQuestionsGet();

  @override
  String toString() => 'QuestionsAllQuestionsGet {}';
}

class QuestionsSearchTextSet extends QuestionsEvent {
  const QuestionsSearchTextSet(this.searchText);

  final String searchText;

  @override
  String toString() => 'QuestionsSearchTextSet {}';
}

class QuestionsShowHeaderSearchBarSet extends QuestionsEvent {
  const QuestionsShowHeaderSearchBarSet({this.showHeaderSearchBar = false});

  final bool showHeaderSearchBar;

  @override
  String toString() => 'QuestionsShowHeaderSearchBarSet {}';
}

class QuestionsQuestionsSearch extends QuestionsEvent {
  const QuestionsQuestionsSearch(this.groupId, this.searchTerm);

  final String groupId;
  final String searchTerm;

  @override
  String toString() => 'QuestionsQuestionsSearch {}';
}

class QuestionsCreateQuestionStreamSubscribe extends QuestionsEvent {
  const QuestionsCreateQuestionStreamSubscribe();

  @override
  String toString() => 'QuestionsCreateQuestionStreamSubscribe {}';
}

class QuestionsUpdateQuestionStreamSubscribe extends QuestionsEvent {
  const QuestionsUpdateQuestionStreamSubscribe();

  @override
  String toString() => 'QuestionsUpdateQuestionStreamSubscribe {}';
}

class QuestionsCreateQuestionStreamUnsubscribe extends QuestionsEvent {
  const QuestionsCreateQuestionStreamUnsubscribe();

  @override
  String toString() => 'QuestionsCreateQuestionStreamUnsubscribe {}';
}

class QuestionsUpdateQuestionStreamUnsubscribe extends QuestionsEvent {
  const QuestionsUpdateQuestionStreamUnsubscribe();

  @override
  String toString() => 'QuestionsUpdateQuestionStreamUnsubscribe {}';
}

class QuestionsUserReport extends QuestionsEvent {
  const QuestionsUserReport(this.userId, this.name, this.description);

  final String userId;
  final String name;
  final String description;

  @override
  String toString() => 'QuestionsUserReport {}';
}
