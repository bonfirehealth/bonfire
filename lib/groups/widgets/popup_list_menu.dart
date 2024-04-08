// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:bonfirehealth/app/constants/constants.dart';
import 'package:bonfirehealth/app/l10n/l10n.dart';
import 'package:bonfirehealth/app/widgets/widgets.dart';

class PopupListMenu extends StatelessWidget {
  const PopupListMenu({
    super.key,
    required this.items,
    required this.itemIds,
    required this.onSelected,
  });

  final List<String> items;
  final List<String> itemIds;
  final void Function(String, String) onSelected;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: AppColourConstant.black1E1F2B.withOpacity(0),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            margin: EdgeInsets.zero,
            child: Container(
              margin: const EdgeInsets.only(left: 16, right: 16, top: 32),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        const Expanded(child: SizedBox()),
                        InkWell(
                          child: SizedBox(
                            width: 18,
                            height: 18,
                            child: AppImage.asset(
                              ImageConstant.closeCross,
                              width: 18,
                              height: 18,
                              fit: BoxFit.cover,
                            ),
                          ),
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    const SpacerVertical(18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          l10n.pleaseChooseGroup,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppColourConstant.grey9A9A9A,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SpacerVertical(8),
                    Container(
                      height: 1,
                      color: AppColourConstant.whiteEFF3FB,
                    ),
                    const SpacerVertical(18),
                    ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: items.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        final item = items[index];
                        final itemId = itemIds[index];
                        return InkWell(
                          onTap: () {
                            onSelected(itemId, item);
                            FocusScope.of(context).unfocus();
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            width: double.infinity,
                            child: Text(
                              item,
                              style: Theme.of(context).textTheme.bodyLarge,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        );
                      },
                    ),
                    const SpacerVertical(18),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
