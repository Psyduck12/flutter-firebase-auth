part of '../sign_up_page.dart';

class _SignUpBody extends StatelessWidget with ValidatorMixin {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  const _SignUpBody({
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
                const _SignUpHeader(),
                const SizedBox(height: 32),
                Text(
                  'Sign Up',
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
                  onChange: context.read<SignUpCubit>().onEmailChanged,
                  validator: emailValidator,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  label: 'Password',
                  hintText: 'Please enter password',
                  icon: 'assets/icons/password.svg',
                  obscureText: true,
                  onChange: context.read<SignUpCubit>().onPasswordChanged,
                  validator: passwordValidator,
                ),
                const SizedBox(height: 24),
                CustomButton(
                  label: 'Sign Up',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      FocusScope.of(context).unfocus();
                      context.read<SignUpCubit>().signUp();
                    }
                  },
                ),
                const CustomDivider(),
                CustomGoogleButton(
                  onTap: context.read<SignUpCubit>().signUpWithGoggle,
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
