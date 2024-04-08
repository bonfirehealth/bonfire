part of '../profile_home_page.dart';

class PreferenceItem extends StatefulWidget {
  const PreferenceItem({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    this.onChanged,
  });

  final String icon;
  final String title;
  final bool isSelected;
  final void Function(bool?)? onChanged;

  @override
  State<PreferenceItem> createState() => _PreferenceItemState();
}

class _PreferenceItemState extends State<PreferenceItem> {
  var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    _isSelected = widget.isSelected;
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
          if (widget.onChanged != null) {
            // ignore: prefer_null_aware_method_calls
            widget.onChanged!(_isSelected);
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: widget.isSelected
                ? Theme.of(context).primaryColor
                : AppColourConstant.whiteEFF3FB,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: AppColourConstant.whiteEFF3FB.withOpacity(0.6),
              spreadRadius: 1,
              blurRadius: 1.2,
              offset: const Offset(0, 1.2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CachedNetworkImage(
                      imageUrl: AmplifyConstant.generateFullS3FilePath(
                        FlavorConfig.instance!.flavor,
                        widget.icon,
                      ),
                      placeholder: (context, url) => SpinKitCircle(
                        color: Theme.of(context).primaryColor,
                      ),
                      fit: BoxFit.scaleDown,
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
            Transform.scale(
              scale: 1.4,
              child: Checkbox(
                fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                  if (states.contains(MaterialState.disabled)) {
                    return Theme.of(context).primaryColor.withOpacity(.32);
                  }
                  return Theme.of(context).primaryColor;
                }),
                checkColor: AppColourConstant.whiteFFFFFF,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                value: widget.isSelected,
                onChanged: (bool? value) {
                  if (widget.onChanged != null) {
                    setState(() {
                      _isSelected = !_isSelected;
                      widget.onChanged!(value);
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
