part of 'browser_bloc.dart';

class BrowserState {
  const BrowserState({
    this.isUrlBypass = false,
    this.title,
    this.url,
  });

  final bool isUrlBypass;
  final String? title;
  final String? url;

  BrowserState copyWith({
    bool? isUrlBypass,
    String? title,
    String? url,
    String? errorMessage,
  }) {
    return BrowserState(
      isUrlBypass: isUrlBypass ?? this.isUrlBypass,
      title: title ?? this.title,
      url: url ?? this.url,
    );
  }
}
