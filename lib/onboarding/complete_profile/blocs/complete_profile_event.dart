part of 'complete_profile_bloc.dart';

@immutable
abstract class CompleteProfileEvent {
  const CompleteProfileEvent();
}

class CompleteProfileInitSet extends CompleteProfileEvent {
  const CompleteProfileInitSet({this.profile});

  final Profile? profile;

  @override
  String toString() => 'CompleteProfileInitSet {}';
}

class CompleteProfileIsLoadingSet extends CompleteProfileEvent {
  const CompleteProfileIsLoadingSet({
    this.isLoading = true,
  });

  final bool isLoading;

  @override
  String toString() => 'CompleteProfileIsLoadingSet {}';
}

class CompleteProfileGenderSet extends CompleteProfileEvent {
  const CompleteProfileGenderSet(this.gender);

  final String gender;

  @override
  String toString() => 'CompleteProfileGenderSet {}';
}

class CompleteProfileAgeSet extends CompleteProfileEvent {
  const CompleteProfileAgeSet(this.age);

  final int age;

  @override
  String toString() => 'CompleteProfileAgeSet {}';
}

class CompleteProfileHeightSet extends CompleteProfileEvent {
  const CompleteProfileHeightSet(this.height);

  final int height;

  @override
  String toString() => 'CompleteProfileHeightSet {}';
}

class CompleteProfileWeightSet extends CompleteProfileEvent {
  const CompleteProfileWeightSet(this.weight);

  final int weight;

  @override
  String toString() => 'CompleteProfileWeightSet {}';
}

class CompleteProfileFormSubmit extends CompleteProfileEvent {
  const CompleteProfileFormSubmit(this.context, {this.isEdit = false});

  final BuildContext context;
  final bool isEdit;

  @override
  String toString() => 'CompleteProfileFormSubmit {}';
}
