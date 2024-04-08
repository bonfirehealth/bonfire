// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

part 'browser_event.dart';
part 'browser_state.dart';

class BrowserBloc extends Bloc<BrowserEvent, BrowserState> {
  BrowserBloc({
    this.title,
    this.url,
    this.isUrlBypass = false,
  }) : super(
          BrowserState(
            title: title,
            url: url,
            isUrlBypass: isUrlBypass,
          ),
        ) {
    on<BrowserInitSet>(_onBrowserBrowserInitSet);
  }

  final bool isUrlBypass;
  final String? title;
  final String? url;

  void _onBrowserBrowserInitSet(
    BrowserInitSet event,
    Emitter<BrowserState> emit,
  ) {
    emit(
      state.copyWith(
        title: event.title,
        url: event.url,
        isUrlBypass: event.isUrlBypass,
      ),
    );
  }
}
