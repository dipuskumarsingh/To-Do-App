

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// custom title text class

class CustomtitleText extends StatelessWidget{
  final String mText;
  final Color mColor;
  final double mSize;
  final FontWeight mFontWeigth;
  final double mLatterSpacing;

  CustomtitleText({required this.mText, this.mColor = Colors.black, this.mSize = 21, this.mFontWeigth = FontWeight.bold, this.mLatterSpacing = 0});
  @override
  Widget build(BuildContext context){
    return Text(mText, style: GoogleFonts.bricolageGrotesque(fontSize: mSize,fontWeight: mFontWeigth, letterSpacing: mLatterSpacing,color: mColor ),);
  }
}

/// custom subTitle text class

class CustomSubTitleText extends StatelessWidget{
  final String mText;
  final Color mColor;
  final double mSize;
  final FontWeight mFontWeigth;
  final double mLatterSpacing;
  CustomSubTitleText({required this.mText, this.mColor = Colors.black, this.mSize = 14, this.mFontWeigth = FontWeight.normal, this.mLatterSpacing = 0});

  @override
  Widget build(BuildContext context){
    return Text(mText,style: GoogleFonts.poppins(fontSize: mSize,fontWeight: mFontWeigth, letterSpacing: mLatterSpacing,color: mColor,),);
  }

}

/// custom container class

class CustomContainer extends StatelessWidget{
  final double mHeight;
  final double mWidth;
  CustomContainer({this.mHeight = 60, this.mWidth = 100});
  @override
  Widget build(BuildContext context){
    return Container(
      height: mHeight,
      width: mWidth,
      decoration: BoxDecoration(
        border: Border.all(width: 2,color: Colors.grey.shade900,)
      ),
    );
  }

}




/// Custom button function

class CustomButton extends StatelessWidget{
  final String mText;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double mHeight;
  final double mWidth;
  final double mElevation;

  CustomButton({required this.mText, required this.onPressed, this.backgroundColor = Colors.yellow, this.mWidth = 160, this.mHeight= 50,this.mElevation = 0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mHeight,
      width: mWidth,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            elevation: 0,
          ),
          onPressed:onPressed,
          child: CustomtitleText(mText: mText,mFontWeigth: FontWeight.w500,mSize: 18,mLatterSpacing: 1,)),
    );
  }
}

/// custom text filed class

class CustomTextFiled extends StatelessWidget{
  final TextEditingController mTextController;
  final String mHintText;
  final TextInputType keyboardType;
  final bool obscure;
  final IconData? suffixIcon;
  CustomTextFiled({required this.mTextController,required this.mHintText,this.keyboardType = TextInputType.text, this.obscure = false, this.suffixIcon});
  @override
  Widget build(BuildContext context){
    return TextField(
      controller: mTextController,
      keyboardType: keyboardType,
      obscureText: obscure,
      decoration: InputDecoration(
        /// this for suffixIcon
        suffixIcon: suffixIcon != null ? Icon(suffixIcon):null,
        filled: true,
        fillColor: Color(0xfff4f4f4),
        hintText: mHintText,
        hintStyle: TextStyle(color: Colors.grey.shade400),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none
        ),
      ),

    );
  }
}


