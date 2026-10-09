import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_ws/data%20base/model.dart';
import 'package:todo_app_ws/statemangement/bloc/blocClass.dart';
import 'package:todo_app_ws/statemangement/bloc/eventclass.dart';
import 'package:todo_app_ws/statemangement/bloc/stateClass.dart';
import 'package:todo_app_ws/statemangement/provider.dart';
import 'package:todo_app_ws/ui%20helper/textWidget.dart';
import 'package:todo_app_ws/ui/addIndividualTask.dart';

class homeScreen extends StatefulWidget {
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  // List<noteDataModel> mNoteData = [];
  @override
  void initState() {
    // context.read<noteProvider>().fetchInitialNoteDataPd();
    context.read<noteBlocClass>().add(fetchInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcfaea),
      // appBar: AppBar(
      //   backgroundColor:Color(0xfffcfaea) ,
      // ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomtitleText(
                      mText: "Hello Dipu",
                      mSize: 30,
                      mColor: Colors.orangeAccent,
                      mFontWeigth: FontWeight.w400,
                      mLatterSpacing: 1,
                    ),
                    CustomtitleText(
                      mText: "Let's Manage Your Task",
                      mSize: 26,
                      mColor: Colors.grey.shade600,
                      mFontWeigth: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomtitleText(
                      mText: "Add Task",
                      mColor: Colors.grey.shade900,
                      mFontWeigth: FontWeight.normal,
                      mSize: 22,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.5),
                          width: 175,
                          height: 125,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.5,
                              color: Colors.grey.shade700,
                            ),
                            borderRadius: BorderRadius.circular(11),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomSubTitleText(
                                mText: "Individual Task",
                                mSize: 16,
                                mFontWeigth: FontWeight.bold,
                              ),
                              CustomSubTitleText(
                                mText:
                                    "Buat Tugas individual mu sekarang juga!",
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      color: Colors.orange.shade200,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        /// operation perform here!
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                addIndividualTask(),
                                          ),
                                        );
                                      },
                                      child: Center(
                                        child: Text(
                                          "Create Task",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade800,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.5),
                          width: 175,
                          height: 125,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.5,
                              color: Colors.grey.shade700,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomSubTitleText(
                                mText: "Team Task",
                                mSize: 16,
                                mFontWeigth: FontWeight.bold,
                              ),
                              CustomSubTitleText(
                                mText:
                                    "Buat Tugas individual mu sekarang juga!",
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      color: Colors.orange.shade200,
                                      borderRadius: BorderRadius.circular(11),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        /// operation perform here!
                                      },
                                      child: Center(
                                        child: Text(
                                          "Create Task",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade800,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomtitleText(
                      mText: "My Task",
                      mColor: Colors.grey.shade900,
                      mFontWeigth: FontWeight.normal,
                      mSize: 22,
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            width: 300,
                            height: 130,
                            decoration: BoxDecoration(
                              color: Color(0xfffcf0a3),
                              borderRadius: BorderRadius.circular(11),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CustomSubTitleText(
                                        mText: "UI Design Mobile App",
                                        mSize: 17,
                                        mFontWeigth: FontWeight.w600,
                                      ),
                                      CustomSubTitleText(
                                        mText:
                                            "Ayo sealseman task mu,\n tingga saidikit lag!!",
                                      ),
                                      Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            25,
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              "assets/images/images (2).jpg",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                /// here we put the pai char UI
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      width: 10,
                                      color: Colors.blue.shade200,
                                    ),
                                  ),
                                  child: Center(
                                    child: CustomSubTitleText(mText: "91.33\%"),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomtitleText(
                      mText: "My Task Today",
                      mColor: Colors.grey.shade900,
                      mFontWeigth: FontWeight.normal,
                      mSize: 22,
                    ),
                    Expanded(
                      child: BlocBuilder<noteBlocClass, stateClass>(builder: (ctx, state){
                        if(state is loadingStateClass) {
                          return Center(child: CircularProgressIndicator(),);
                        }
                        if(state is errorStateClass){
                          return Center(child: Text(state.errorMsg),);
                        }
                        if(state is loadedStateClass){
                          return  state.mNoteModel.isNotEmpty ? GridView.builder(
                            itemCount: state.mNoteModel.length,
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index) {
                              return Card(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomtitleText(
                                          mText:
                                          '${state.mNoteModel[index].title}',
                                          mSize: 17,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            /// opration perform here
                                          },
                                          icon: Icon(
                                            Icons.check_circle_outline,
                                            color: Colors.grey.shade400,
                                            size: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    CustomSubTitleText(
                                      mText:
                                      '${state.mNoteModel[index].subTitle}',
                                    ),
                                    SizedBox(height: 10),
                                    CustomSubTitleText(
                                      mText:
                                      "${state.mNoteModel[index].initialTime} - ${state.mNoteModel[index].lastTime}"
                                          .replaceAll("TimeOfDay", "")
                                          .replaceAll("(", "")
                                          .replaceAll(")", ""),
                                      mSize: 16,
                                      mColor: Colors.grey.shade700,
                                    ),
                                    CustomSubTitleText(
                                      mText: "${state.mNoteModel[index].createdAt}".replaceAll("00:00:00.000", "",),
                                      mSize: 16,
                                      mColor: Colors.grey.shade700,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ): Container();
                        }
                        return SizedBox();
                      })
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
