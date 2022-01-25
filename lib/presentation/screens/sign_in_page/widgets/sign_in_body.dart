part of '../sign_in_page.dart';

class _SignInBody extends StatelessWidget with ValidatorMixin {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  const _SignInBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 24),
                const _SignInHeader(),
                const SizedBox(height: 32),
                Text(
                  'Sign In',
                  style: ThemeText.semibold.copyWith(
                    color: ThemeColor.primary,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 32),
                CustomTextFormField(
                  label: 'Email',
                  hintText: 'Please enter email',
                  icon: 'assets/icons/email.svg',
                  onChange: context.read<SignInCubit>().onEmailChanged,
                  validator: emailValidator,
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  label: 'Password',
                  hintText: 'Please enter password',
                  icon: 'assets/icons/password.svg',
                  obscureText: true,
                  onChange: context.read<SignInCubit>().onPasswordChanged,
                  validator: passwordValidator,
                ),
                const SizedBox(height: 4),
                const _ForgotPasswordButton(),
                const SizedBox(height: 4),
                CustomButton(
                  label: 'Sign In',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      FocusScope.of(context).unfocus();
                      context.read<SignInCubit>().signIn();
                    }
                  },
                ),
                const CustomDivider(),
                CustomGoogleButton(
                  onTap: context.read<SignInCubit>().signInWithGoggle,
                ),
                const SizedBox(height: 32),
                const _NavigateButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
