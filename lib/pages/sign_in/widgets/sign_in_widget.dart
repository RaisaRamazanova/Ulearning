import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        height: 1.0,
      ),
    ),
    title: Center(
      child: Text(
          "Log In",
          style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 16.sp,
              fontWeight: FontWeight.normal
          )
      ),
    ),
  );
}

Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(top: 30.h, bottom: 20.h, right: 80.w, left: 80.w),
    child: Center(child:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _reusableIcons('google'),
          _reusableIcons('apple'),
          _reusableIcons('facebook')
        ],
      )
    ),
  );
}

Widget _reusableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset('assets/icons/$iconName.png'),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey.withOpacity(0.3),
        fontSize: 14.sp,
        fontWeight: FontWeight.normal
      ),
    ),
  );
}

Widget buildTextField(bool hasError, String hintText, String textType, String iconName,
    void Function(String value)? func ) {
  return Container(
    margin: EdgeInsets.only(bottom: 20.h),
    width: 325.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(15.w)),
      border: Border.all(color: hasError ? AppColors.primaryFourthElementText : Colors.red),

    ),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 17.w),
          width: 16.w,
          height: 16.w,
          child: Image.asset('assets/icons/$iconName.png'),
        ),
        SizedBox(
          width: 260.w,
          height: 50.h,
          child: TextField(
            onChanged: (value) => func!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText:  hintText,
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                )
              ),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.transparent
                    )
                ),
                disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.transparent
                    )
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.transparent
                    )
                ),
              hintStyle: const TextStyle(
                  color: AppColors.primarySecondaryElementText
              ),
            ),
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.normal,
              fontSize: 12.sp
            ),
            autocorrect: false,
            obscureText: textType == 'password' ? true : false,
          ),
        )
      ],
    )
  );
}

Widget forgotPassword() {
  return Container(
    margin: EdgeInsets.only(left: 25.w),
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        'Forgot password?',
        style: TextStyle(
          color: AppColors.primaryText,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryText,
          fontSize: 12.sp
        ),
      ),
    ),
  );
}

Widget buildLogInAndReqButton(String buttonName, String buttonType) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(left: 25.w, right: 25.w, top: buttonType == 'login'
          ? 40.h
          : 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        color: buttonType == 'login'
            ? AppColors.primaryElement
            : AppColors.primaryBackground,
        border: Border.all(
            color: buttonType == 'login'
                ? Colors.transparent
                : AppColors.primaryFourthElementText
        ),
          boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
            color: Colors.grey.withOpacity(0.1)
          )
        ]
      ),
      child: Center(
        child: Text(
            buttonName,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: buttonType == 'login'
                ? AppColors.primaryBackground
                : AppColors.primaryText
          ),
        ),
      ),
    ),
  );
}