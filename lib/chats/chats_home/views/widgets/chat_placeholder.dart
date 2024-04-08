part of '../chats_home_page.dart';

class ChatPlaceholder extends StatelessWidget {
  const ChatPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          textBaseline: TextBaseline.alphabetic,
          children: const [
            Icon(Icons.warning_amber_outlined),
            SizedBox(
              width: 5,
            ),
            Text(
              'I have the following limitations',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
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
        const SizedBox(
          height: 10,
        ),
        _buildCautionBox(
          'This is not a replacement for a doctor consultation. If you are not feeling well, please see a doctor immediately.',
        ),
      ],
    );
  }

  FractionallySizedBox _buildCautionBox(String text) {
    return FractionallySizedBox(
      widthFactor: 0.6,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: const BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
