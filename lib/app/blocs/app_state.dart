part of 'app_bloc.dart';

class AppState {
  const AppState({
    this.currentLocale,
    this.isLoading = false,
    this.isErrorDialogShown = false,
    this.isInfoDialogShown = false,
    this.errorTitle,
    this.errorMessage,
    this.infoTitle,
    this.infoMessage,
    this.loadingText,
    this.themeColour = '',
    this.context,
  });

  final String? currentLocale;
  final bool isLoading;
  final bool isErrorDialogShown;
  final bool isInfoDialogShown;
  final String? errorTitle;
  final String? errorMessage;
  final String? infoTitle;
  final String? infoMessage;
  final String? loadingText;
  final String themeColour;
  final BuildContext? context;

  AppState copyWith({
    String? currentLocale,
    bool? isLoading,
    bool? isErrorDialogShown,
    bool? isInfoDialogShown,
    String? errorTitle,
    String? errorMessage,
    String? infoTitle,
    String? infoMessage,
    String? loadingText,
    String? themeColour,
    BuildContext? context,
  }) {
    return AppState(
      currentLocale: currentLocale ?? this.currentLocale,
      isLoading: isLoading ?? this.isLoading,
      isErrorDialogShown: isErrorDialogShown ?? false,
      isInfoDialogShown: isInfoDialogShown ?? false,
      errorTitle: errorTitle ?? '',
      errorMessage: errorMessage ?? '',
      infoTitle: infoTitle ?? '',
      infoMessage: infoMessage ?? '',
      loadingText: loadingText ?? this.loadingText,
      themeColour: themeColour ?? this.themeColour,
      context: context ?? this.context,
    );
  }
}
