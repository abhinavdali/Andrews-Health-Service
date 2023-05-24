import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp/Logic/Report_bloc/report_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Extracted Widgets/const.dart';
import '../../Extracted Widgets/custom_text.dart';
import '../../Logic/News_bloc/news_bloc.dart';

class MyReports extends StatefulWidget {
  const MyReports({Key? key}) : super(key: key);

  @override
  _MyReportsState createState() => _MyReportsState();
}

class _MyReportsState extends State<MyReports> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ReportBloc>(context).add(OnReportLoad());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'My Reports',
          color: Colors.white,
          weight: FontWeight.w600,
        ),
        backgroundColor: Colors.blue.shade300,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: kColorGrey,
      body: Column(
        children: [
          Expanded(child: BlocBuilder<ReportBloc, ReportState>(
            builder: (context, state) {
              if (state is ReportLoading) {
                return Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              if (state is ReportLoaded) {
                var def = state.reportModel.report;
                if(def.isNotEmpty){
                return ListView.builder(
                    itemCount: def.length,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(bottom: 16),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              boxShadow: [shadow],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text:
                                    '${def[i].date.toString().substring(0, def[i].date.toString().indexOf(' '))}',
                                color: Colors.grey,
                                fontSize: 9.sp,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              CustomText(
                                text: '${def[i].patientName}',
                                color: Colors.black,
                                weight: FontWeight.w600,
                              ),
                              Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              CustomText(text: 'Symptoms: ${def[i].symtomps}'),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              CustomText(
                                  text:
                                      'Prescription: ${def[i].prescriptions}'),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                      text: 'Date of Birth: ${def[i].date}'),
                                  Icon(
                                      def[i].sex == 'Male'
                                          ? Icons.male_outlined
                                          : Icons.female_outlined,
                                      color: def[i].sex == 'Male'
                                          ? Colors.blue
                                          : Colors.pinkAccent)
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    });}else{
                  return Center(child: CustomText(text: 'There are no reports yet.',),);
                }
              }
              if (state is ReportError) {}
              return Center(
                child: CircularProgressIndicator.adaptive(),
              );
            },
          ))
        ],
      ),
    );
  }
}
