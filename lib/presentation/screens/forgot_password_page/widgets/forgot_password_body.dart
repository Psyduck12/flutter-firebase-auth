part of '../forgot_password_page.dart';

class _ForgotPasswordBody extends StatelessWidget with ValidatorMixin {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  const _ForgotPasswordBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            CustomTextFormField(
              label: 'Email',
              hintText: 'Please enter email',
              icon: 'assets/icons/email.svg',
              onChange: context.read<ForgotPasswordCubit>().onEmailChanged,
              validator: emailValidator,
            ),
            const SizedBox(height: 32),
            CustomButton(
              label: 'Send Email',
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  FocusScope.of(context).unfocus();
                  context.read<ForgotPasswordCubit>().resetPassword();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
