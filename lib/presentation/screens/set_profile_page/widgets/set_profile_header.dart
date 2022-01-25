part of '../set_profile_page.dart';

class _SetProfileHeader extends StatelessWidget {
  const _SetProfileHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Text(
          'Set Your Profile',
          style: ThemeText.semibold.copyWith(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
