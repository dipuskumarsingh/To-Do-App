import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_ws/data%20base/model.dart';
import 'package:todo_app_ws/statemangement/bloc/blocClass.dart';
import 'package:todo_app_ws/statemangement/bloc/eventclass.dart';
import 'package:todo_app_ws/ui%20helper/textWidget.dart';
import 'package:todo_app_ws/ui/bottomNavigation.dart';

class addIndividualTask extends StatefulWidget {
  @override
  State<addIndividualTask> createState() => _addIndividualTaskState();
}

class _addIndividualTaskState extends State<addIndividualTask> {
  TextEditingController titleController = TextEditingController();

  TextEditingController subTitleController = TextEditingController();
  DateTime? selectDateTime;
  DateFormat df = DateFormat.yMd();
  TimeOfDay initialSelectedTime = TimeOfDay.now();
  TimeOfDay lastSelectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 10, left: 10),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomtitleText(
                    mText: "Individual Task",
                    mSize: 30,
                    mFontWeigth: .w500,
                  ),
                  CustomtitleText(
                    mText: "Add Your Today Task",
                    mSize: 21,
                    mColor: Colors.grey.shade400,
                    mFontWeigth: .normal,
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomtitleText(
                    mText: "Title",
                    mSize: 18,
                    mFontWeigth: .w500,
                  ),
                  CustomTextFiled(
                    mTextController: titleController,
                    mHintText: "Add title",
                  ),
                  CustomtitleText(
                    mText: "Description",
                    mSize: 18,
                    mFontWeigth: .w500,
                  ),
                  CustomTextFiled(
                    mTextController: subTitleController,
                    mHintText: "Add Your Description",
                  ),
                  CustomtitleText(
                    mText: "Select Your Time To Complete Your Work",
                    mSize: 18,
                    mFontWeigth: .w500,
                  ),
                  CustomtitleText(
                    mText: "${df.format(DateTime.now())}",
                    mSize: 18,
                    mFontWeigth: .w500,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomtitleText(
                        mText:
                            "${initialSelectedTime.hour} : ${initialSelectedTime.minute}",
                      ),
                      CustomtitleText(
                        mText:
                        "${df.format(selectDateTime ?? DateTime.now())}",
                      ),
                      CustomtitleText(
                        mText:
                            "${lastSelectedTime.hour} : ${lastSelectedTime.minute}",
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        mText: "Start Time",
                        backgroundColor: Color(0xffedfd3d),
                        onPressed: () async {
                          TimeOfDay? timeOfDay = await showTimePicker(
                            context: context,
                            initialTime: initialSelectedTime,
                            initialEntryMode: TimePickerEntryMode.dialOnly,
                          );
                          if (timeOfDay != null) {
                            initialSelectedTime = timeOfDay;
                            setState(() {});
                          }
                        },
                      ),
                      IconButton( icon: Icon(Icons.date_range_outlined) , onPressed: ()async {
                        selectDateTime = await showDatePicker(context: context, firstDate: DateTime(2025), lastDate: DateTime.now());
                        setState(() {

                        });
                      }),
                      CustomButton(
                        mText: "Last Time",
                        backgroundColor: Color(0xffedfd3d),
                        onPressed: () async {
                          TimeOfDay? timeOfDay = await showTimePicker(
                            context: context,
                            initialTime: lastSelectedTime,
                            initialEntryMode: TimePickerEntryMode.dialOnly,
                          );
                          if(timeOfDay != null){
                            lastSelectedTime = timeOfDay;
                            setState(() {

                            });
                          }
                        },
                      ),
                    ],
                  ),

                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      mText: "Done",
                      backgroundColor: Color(0xffedfd3d),
                      onPressed: ()async {
                        SharedPreferences perfs = await SharedPreferences.getInstance();
                         int newUid = await perfs.getInt("user_id") ?? 0;
                         context.read<noteBlocClass>().add(addNoteEvent(newNoteModel: noteDataModel(
                           uId: newUid,
                           title: titleController.text,
                           subTitle: subTitleController.text,
                           initialTime: initialSelectedTime.toString(),
                           lastTime:lastSelectedTime.toString(),
                           createdAt: selectDateTime.toString(),
                         )));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => bottomNavigation(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
