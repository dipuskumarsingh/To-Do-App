

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_ws/data%20base/DbHelper.dart';
import 'package:todo_app_ws/data%20base/model.dart';
import 'package:todo_app_ws/statemangement/provider.dart';
import 'package:todo_app_ws/ui%20helper/textWidget.dart';
import 'package:todo_app_ws/ui/onbording/login.dart';

class registerScreen extends StatelessWidget{
  TextEditingController nameController = TextEditingController();
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
                    CustomtitleText(mText: "Create an account",mSize: 30,mFontWeigth: .w500),
                    CustomtitleText(mText: "Already have an account? Log in",mSize: 16,mColor: Colors.grey.shade400,mFontWeigth: .normal,),
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
                          CustomButton(mText: "Login", onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                          },backgroundColor: Color(0xfff4f4f4)),
                          CustomButton(mText: "Register", onPressed: (){},backgroundColor: Color(0xffedfd3d),),
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
                  CustomtitleText(mText: "Full Name",mSize: 18,mFontWeigth: .w500,),
                  CustomTextFiled(
                    mTextController: nameController,
                    mHintText: "Name",
                  ),
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
                          mText: "Register",
                          backgroundColor:  Color(0xffedfd3d),
                          onPressed: ()async{
                            if(! await db.isUserAllReadyRegister(email: emailController.text)){
                              userDataModel newUser = userDataModel(fullName: nameController.text, email: emailController.text, password: passwordController.text);
                              bool check = await db.userRegister(user: newUser);
                              if(check){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User successfully register! ")));
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                              } else{
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Some thing wrong, please try again! ")));
                              }
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("user already register, login now!")));
                            }
                          },
                      ),
                    ),
 /*                   Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Divider(thickness: 10,color: Colors.green),

                        CustomSubTitleText(mText: "Or continue with"),
                        Divider(color: Colors.red,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          child: CustomButton(
                            mText: "Google",
                            backgroundColor:  Colors.white,
                            onPressed: (){},
                          ),
                        ),
                        SizedBox(
                          child: CustomButton(
                            mText: "Apple",
                            backgroundColor:  Colors.white,
                            onPressed: (){},
                          ),
                        ),
                      ],
                    )*/
                  ],
                )),
          ],
        ),
      ),
    );
  }
}