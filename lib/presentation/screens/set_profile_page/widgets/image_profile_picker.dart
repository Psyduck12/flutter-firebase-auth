part of '../set_profile_page.dart';

class _ImageProfilePicker extends StatelessWidget {
  const _ImageProfilePicker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final File? pickedImage = await ImagePickerHelper.selectImage();
        context.read<SetProfileCubit>().onImageChanged(pickedImage);
      },
      child: const _ImageProfile(),
    );
  }
}

class _ImageProfile extends StatelessWidget {
  const _ImageProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetProfileCubit, SetProfileState>(
      buildWhen: (p, c) => p.image != c.image,
      builder: (context, state) {
        if (state.image != null) {
          return CircleAvatar(
            backgroundImage: FileImage(state.image!),
            radius: 60,
          );
        } else {
          return SvgPicture.asset('assets/icons/user_placeholder.svg');
        }
      },
    );
  }
}
