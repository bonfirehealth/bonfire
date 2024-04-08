part of '../web_screening_page.dart';

class AnimatedCount extends ImplicitlyAnimatedWidget {
  const AnimatedCount({
    super.key,
    required this.count,
    required super.duration,
    this.fontSize = 32,
    this.fractionDigits = 0,
    this.color = AppColourConstant.black1E1F2B,
    super.curve,
  });

  final num count;
  final double fontSize;
  final int fractionDigits;
  final Color color;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() {
    return _AnimatedCountState();
  }
}

class _AnimatedCountState extends AnimatedWidgetBaseState<AnimatedCount> {
  IntTween? _intCount;
  Tween<double>? _doubleCount;

  @override
  Widget build(BuildContext context) {
    return widget.count is int
        ? AutoSizeText(
            _intCount!.evaluate(animation).toString(),
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: widget.color,
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.w500,
                ),
            textAlign: TextAlign.start,
            maxLines: 1,
          )
        : AutoSizeText(
            _doubleCount!.evaluate(animation).toStringAsFixed(widget.fractionDigits),
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: widget.color,
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.w500,
                ),
            textAlign: TextAlign.start,
            maxLines: 1,
          );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    if (widget.count is int) {
      _intCount = visitor(
        _intCount,
        widget.count,
        (dynamic value) => IntTween(begin: value as int?),
      ) as IntTween?;
    } else {
      _doubleCount = visitor(
        _doubleCount,
        widget.count,
        (dynamic value) => Tween<double>(begin: value as double?),
      ) as Tween<double>?;
    }
  }
}
