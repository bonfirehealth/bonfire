part of '../chats_home_page.dart';

class ChatLimitations extends StatelessWidget {
  const ChatLimitations({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColourConstant.whiteFFFFFF,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 30),
              const Icon(
                FeatherIcons.alertTriangle,
                size: 40,
              ),
              InkWell(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: AppImage.asset(
                    ImageConstant.closeCross,
                    fit: BoxFit.cover,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          const SizedBox(height: 35),
          const Text(
            'We have put in place guardrails like Moderation rules to restrict answering sensitive questions. Please also take note of the following limitations:',
            style: TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 35,
          ),
          _buildCautionBox('May occasionally generate incorrect information'),
          const SizedBox(
            height: 10,
          ),
          _buildCautionBox('May occasionally produce harmful instructions or biased content'),
          const SizedBox(
            height: 10,
          ),
          _buildCautionBox('Limited knowledge of world and events after 2021'),
        ],
      ),
    );
  }

  Container _buildCautionBox(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 28),
      decoration: const BoxDecoration(
        color: AppColourConstant.textFieldGreyFillF4F4F8,
        borderRadius: BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
