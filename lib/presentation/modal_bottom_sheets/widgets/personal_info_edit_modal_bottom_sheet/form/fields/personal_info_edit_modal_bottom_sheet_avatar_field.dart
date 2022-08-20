part of modal_bottom_sheets;

class PersonalInfoEditModalBottomSheetAvatarField extends StatelessWidget {
  final PersonalInfoEditModalBottomSheetCubit _cubit;
  const PersonalInfoEditModalBottomSheetAvatarField(this._cubit, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: _cubit.genderStream,
        initialData: _cubit.genderValue,
        builder: (context, snapshot) {
          final genderValue = snapshot.data;
          return AnimatedContainer(
            duration: Durations.twoHundredFiftyMillisecondsDuration,
            key: UniqueKey(),
            width: 15.h,
            height: 15.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: svg_provider.Svg(_image(genderValue)),
                    fit: BoxFit.cover)),
          );
        });
  }

  String _image(String? gender) =>
      AppAssets.avatarImage(gender.toString().toLowerCase());
}
