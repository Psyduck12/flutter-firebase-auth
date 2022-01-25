part of '../welcome_page.dart';

class _WelcomeBody extends StatelessWidget {
  const _WelcomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 80),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: SvgPicture.asset(
                'assets/illustrations/welcome.svg',
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Chatty',
              style: ThemeText.semibold.copyWith(
                color: ThemeColor.primary,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 32),
            CustomButton(
              label: 'Sign In',
              onTap: () => Navigator.pushNamed(context, SignInPage.routeName),
            ),
            const SizedBox(height: 16),
            CustomButton(
              label: 'Sign Up',
              isSecondary: true,
              onTap: () => Navigator.pushNamed(context, SignUpPage.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
