part of modal_bottom_sheets;

class PersonalInfoEditModalBottomSheetGenderField extends StatelessWidget {
  final PersonalInfoEditModalBottomSheetCubit _cubit;
  const PersonalInfoEditModalBottomSheetGenderField(this._cubit, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 5.h,
          child: ListView.builder(
              itemCount: _cubit.genders.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final gender = _cubit.genders[index];
                return StreamBuilder<String>(
                    stream: _cubit.genderStream,
                    builder: (context, snapshot) {
                      final genderValue = snapshot.data;
                      return Padding(
                        padding: index > 0
                            ? EdgeInsets.only(left: 4.w)
                            : EdgeInsets.zero,
                        child: GestureDetector(
                            onTap: () {
                              _cubit.updateGender(gender);
                            },
                            child: AnimatedSwitcher(
                              duration: DurationsUtil
                                  .twoHundredFiftyMillisecondsDuration,
                              transitionBuilder:
                                  (Widget child, Animation<double> animation) =>
                                      ScaleTransition(
                                          scale: animation, child: child),
                              child: Row(
                                key: UniqueKey(),
                                children: [
                                  _isSelected(genderValue.toString(), gender)
                                      ? activeRadioButton()
                                      : disabledRadioButton(),
                                  SizedBox(width: 3.w),
                                  Text(
                                    gender,
                                    style: AppStyles
                                        .secondaryGreyColor10spw600Montserrat,
                                  ),
                                ],
                              ),
                            )),
                      );
                    });
              }),
        ),
      ],
    );
  }

  bool _isSelected(String selectedGender, String gender) =>
      selectedGender == gender;

  Container disabledRadioButton() {
    return Container(
      width: 3.h,
      height: 3.h,
      decoration: const BoxDecoration(
          color: AppPalette.fourthGrayColor, shape: BoxShape.circle),
    );
  }

  Container activeRadioButton() {
    return Container(
      width: 3.h,
      height: 3.h,
      decoration: const BoxDecoration(
        color: AppPalette.fourthGrayColor,
        shape: BoxShape.circle,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 2.h,
          height: 2.h,
          decoration: const BoxDecoration(
            color: AppPalette.mainOrangeColor,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
