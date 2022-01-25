part of '../set_profile_page.dart';

class _SetProfileBody extends StatelessWidget with ValidatorMixin {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  const _SetProfileBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _ImageProfilePicker(),
        const SizedBox(height: 40),
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                CustomTextFormField(
                  label: 'Username',
                  hintText: 'Please enter username',
                  icon: 'assets/icons/user.svg',
                  onChange: context.read<SetProfileCubit>().onUsernameChanged,
                  validator: usernameValidator,
                ),
                const SizedBox(height: 32),
                CustomButton(
                  label: 'Confirm',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      FocusScope.of(context).unfocus();
                      context.read<SetProfileCubit>().createUserProfile();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
