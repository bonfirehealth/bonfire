part of 'browser_bloc.dart';

@immutable
abstract class BrowserEvent {
  const BrowserEvent();
}

class BrowserInitSet extends BrowserEvent {
  const BrowserInitSet(
    this.title,
    this.url, {
    this.isUrlBypass = false,
  });

  final String title;
  final String url;
  final bool isUrlBypass;

  @override
  String toString() =>
      'BrowserInitSet { title: $title, url: $url, isUrlBypass: $isUrlBypass }';
}
