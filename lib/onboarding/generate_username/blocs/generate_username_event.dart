part of 'generate_username_bloc.dart';

@immutable
abstract class GenerateUsernameEvent {
  const GenerateUsernameEvent();
}

class GenerateUsernameInitSet extends GenerateUsernameEvent {
  const GenerateUsernameInitSet(this.context);

  final BuildContext context;

  @override
  String toString() => 'GenerateUsernameInitSet {}';
}

class GenerateUsernameIsLoadingSet extends GenerateUsernameEvent {
  const GenerateUsernameIsLoadingSet({
    this.isLoading = true,
  });

  final bool isLoading;

  @override
  String toString() => 'GenerateUsernameIsLoadingSet {}';
}

class GenerateUsernameUsernameSet extends GenerateUsernameEvent {
  const GenerateUsernameUsernameSet(this.username);

  final String username;

  @override
  String toString() => 'GenerateUsernameUsernameSet {}';
}

class GenerateUsernameUsernameGenerate extends GenerateUsernameEvent {
  const GenerateUsernameUsernameGenerate(this.controller);

  final TextEditingController controller;

  @override
  String toString() => 'GenerateUsernameUsernameGenerate {}';
}

class GenerateUsernameFormSubmit extends GenerateUsernameEvent {
  const GenerateUsernameFormSubmit(this.context);

  final BuildContext context;

  @override
  String toString() => 'GenerateUsernameFormSubmit {}';
}

class GenerateUsernamePersonalEmailAddressSet extends GenerateUsernameEvent {
  const GenerateUsernamePersonalEmailAddressSet(this.personalEmailAddress);

  final String personalEmailAddress;

  @override
  String toString() => 'GenerateUsernamePersonalEmailAddressSet {}';
}

class GenerateUsernameGeneratedCredentialsSend extends GenerateUsernameEvent {
  const GenerateUsernameGeneratedCredentialsSend(this.context);

  final BuildContext context;

  @override
  String toString() => 'GenerateUsernameGeneratedCredentialsSend {}';
}

class GenerateUsernameAutoSignIn extends GenerateUsernameEvent {
  const GenerateUsernameAutoSignIn(this.context);

  final BuildContext context;

  @override
  String toString() => 'GenerateUsernameAutoSignIn {}';
}

class GenerateUsernameCredentialsClipboardCopy extends GenerateUsernameEvent {
  const GenerateUsernameCredentialsClipboardCopy(this.context);

  final BuildContext context;

  @override
  String toString() => 'GenerateUsernameCredentialsClipboardCopy {}';
}
