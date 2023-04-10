import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp/Extracted%20Widgets/const.dart';
import 'package:fyp/Extracted%20Widgets/custom_text.dart';
import 'package:fyp/Logic/Doctor_bloc/bloc/doctor_bloc.dart';
import 'package:sizer/sizer.dart';

class Consultation extends StatefulWidget {
  const Consultation({super.key});

  @override
  State<Consultation> createState() => _ConsultationState();
}

class _ConsultationState extends State<Consultation> {
  @override
  void initState() {
    BlocProvider.of<DoctorBloc>(context).add(OnDoctorLoad());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorGrey,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        centerTitle: true,
        title: CustomText(
          text: 'Consultation',
          color: Colors.white,
          weight: FontWeight.w600,
        ),
        elevation: 0,
      ),
      body: Column(children: [
        BlocBuilder<DoctorBloc, DoctorState>(builder: (context, state) {
          if (state is DoctorInitial) {
            print('init');
          } else if (state is DoctorLoading) {
            return Expanded(
                child: Center(child: CircularProgressIndicator.adaptive()));
          } else if (state is DoctorLoaded) {
            var def = state.doctorModel.doctors;
            return Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  shrinkWrap: true,
                  itemCount: def.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [shadow],
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    bottomLeft: Radius.circular(12)),
                                child: Image.network(
                                  'https://andrews-health-services-production.up.railway.app/uploads/${def[index].uploadedFile.path}',
                                  height: 16.h,
                                  width: 40.w,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: 'Dr. ${def[index].name}',
                                      weight: FontWeight.w600,
                                      fontSize: 13.sp,
                                    ),
                                    CustomText(
                                        text:
                                            '${def[index].designation} • ${def[index].education}'),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.phone_outlined,
                                          size: 15,
                                        ),
                                        CustomText(
                                            text: ' ${def[index].phone}'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.schedule,
                                          size: 15,
                                        ),
                                        CustomText(
                                          text: ' ${def[index].timing}',
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, right: 8),
                            child: Icon(Icons.favorite_border_outlined),
                          )
                        ],
                      ),
                    );
                  }),
            );
          }

          return Center(child: CircularProgressIndicator.adaptive());
        })
      ]),
    );
  }
}
