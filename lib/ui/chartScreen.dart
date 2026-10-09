import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_ws/data%20base/model.dart';
import 'package:todo_app_ws/statemangement/provider.dart';

import '../ui helper/textWidget.dart';

class chartScreen extends StatefulWidget {
  @override
  State<chartScreen> createState() => _chartScreenState();
}

class _chartScreenState extends State<chartScreen> {
  List<noteDataModel> mNotesData = [];
  @override
  void initState() {
    context.read<noteProvider>().fetchInitialNoteDataPd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*      appBar: AppBar(
        backgroundColor: Colors.white,
      ),*/
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  CustomtitleText(
                    mText: "My Chart a Week",
                    mColor: Colors.grey.shade900,
                    mFontWeigth: FontWeight.normal,
                    mSize: 22,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomtitleText(
                    mText: "My Task Activity",
                    mColor: Colors.grey.shade900,
                    mFontWeigth: FontWeight.normal,
                    mSize: 22,
                  ),
                  CustomSubTitleText(
                    mText: "in jan 2026",
                    mColor: Colors.grey.shade900,
                    mFontWeigth: FontWeight.normal,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomtitleText(
                    mText: "${mNotesData.length} Task",
                    mColor: Colors.grey.shade900,
                    mFontWeigth: FontWeight.normal,
                    mSize: 22,
                  ),
                  Expanded(
                    child: Consumer(builder: (ctx, provider, child){
                      return mNotesData.isNotEmpty ? GridView.builder(
                        itemCount: mNotesData.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.pink.shade200,
                              borderRadius: BorderRadius.circular(21),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
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
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        CustomSubTitleText(
                                          mText: '${mNotesData[index].title}',
                                          mSize: 19,
                                        ),
                                        SizedBox(height: 8),
                                        CustomSubTitleText(
                                          mText:
                                          '${mNotesData[index].subTitle}',
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ) :Container();
                    })
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
