import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp/UI/loginandsignup/login.dart';
import 'package:sizer/sizer.dart';

import '../../Extracted Widgets/const.dart';
import '../../Extracted Widgets/custom_text.dart';
import '../../Logic/Services_bloc/services_bloc.dart';

class OtherServices extends StatefulWidget {
  const OtherServices({Key? key}) : super(key: key);

  @override
  _OtherServicesState createState() => _OtherServicesState();
}

class _OtherServicesState extends State<OtherServices> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<ServicesBloc>(context).add(OnServicesLoad());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Other Services',
          weight: FontWeight.w700,
          color: Colors.white,
          fontSize: 12.sp,
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ServicesBloc, ServicesState>(
              builder: (context, state) {
                if (state is ServicesLoading) {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                if (state is ServicesLoaded) {
                  var def = state.servicesModel.services;
                  return ListView.builder(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                      itemCount: def.length,
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [shadow],
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)),
                                child: Image.network(
                                  'https://andrews-health-services-production.up.railway.app/uploads/${def[i].uploadedFile.path}',
                                  height: 16.h,
                                  width: double.infinity,
                                  fit: BoxFit.fitHeight,
                                  errorBuilder: (BuildContext context,
                                      Object exception, StackTrace? stackTrace) {
                                    return Container(
                                      height: 16.h,
                                      width: double.infinity,
                                      color: Colors.grey,
                                      child: Icon(
                                        Icons.error,
                                        color: Colors.white,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: '${def[i].serviceName}',
                                      fontSize: 14.sp,
                                      weight: FontWeight.w600,
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        child: CustomText(
                                          text: '${def[i].description}',
                                          color: Colors.grey,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                }
                if (state is ServicesError) {
                  return Center(
                    child: SizedBox(
                      height: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: 'Something went wrong',
                            fontSize: 13.sp,
                            weight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: LoginButton(
                                text: 'Try Aain',
                                color: Colors.blue,
                                onTap: () {
                                  BlocProvider.of<ServicesBloc>(context)
                                      .add(OnServicesLoad());
                                }),
                          )
                        ],
                      ),
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
