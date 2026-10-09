


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_ws/data%20base/DbHelper.dart';
import 'package:todo_app_ws/ui%20helper/textWidget.dart';
import 'package:todo_app_ws/ui/bottomNavigation.dart';
import 'package:todo_app_ws/ui/onbording/register.dart';

class LoginScreen extends StatelessWidget{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  dataBaseH db = dataBaseH.initialiseDB();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 50,right: 10,left: 10),
        child: Column(
          children: [
            Expanded(flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomtitleText(mText: "Step Into The Future of Working",mSize: 30,mFontWeigth: .w500),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      height: 65,
                      decoration: BoxDecoration(
                        color: Color(0xfff4f4f4),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(mText: "Login", onPressed: (){},backgroundColor: Color(0xffedfd3d)),
                          CustomButton(mText: "Register", onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>registerScreen()));
                          },backgroundColor: Color(0xfff4f4f4),),
                        ],
                      ),
                    )
                  ],
                )),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomtitleText(mText: "Email Address",mSize: 18,mFontWeigth: .w500,),
                  CustomTextFiled(
                    mTextController: emailController,
                    mHintText: "Email@.com",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  CustomtitleText(mText: "Password",mSize: 18,mFontWeigth: .w500,),
                  CustomTextFiled(
                    mTextController: passwordController,
                    obscure: true,
                    mHintText: "*******",
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: Icons.remove_red_eye,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomtitleText(mText: "Forget Password",mSize: 14,mFontWeigth: FontWeight.normal,mColor: Colors.grey.shade400,)
                    ],
                  ),
                  SizedBox(height: 60,)
                ],
              ),
            ),
            Expanded(flex: 2,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        mText: "Login",
                        backgroundColor:  Color(0xffedfd3d),
                        onPressed: ()async{
                          bool check = await db.authenticateUser(email: emailController.text, password: passwordController.text);
                          if(check){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User login successfully!")));
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>bottomNavigation()));
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid email and password, please try again!")));
                          }
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomSubTitleText(mText: "Don't have an account?",mSize: 14,mFontWeigth: FontWeight.normal,mColor: Colors.grey.shade400,),
                        TextButton(onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>registerScreen()));
                        }, child: CustomSubTitleText(mText: "Sign up",mSize: 14,mFontWeigth: FontWeight.w500,),
                        )
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}