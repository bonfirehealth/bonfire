part of '../generated_credentials_page.dart';

class GeneratedCredentialsHeader extends StatelessWidget {
  const GeneratedCredentialsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<GenerateUsernameBloc, GenerateUsernameState>(
      builder: (_, state) {
        return Column(
          children: [
            const SpacerVertical(32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                l10n.generateCredentialsPageTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColourConstant.black1E1F2B,
                    ),
              ),
            ),
            const SpacerVertical(32),
          ],
        );
      },
    );
  }
}
