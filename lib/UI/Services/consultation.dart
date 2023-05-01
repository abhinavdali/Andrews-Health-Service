import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp/Extracted%20Widgets/const.dart';
import 'package:fyp/Extracted%20Widgets/custom_text.dart';
import 'package:fyp/Logic/Doctor_bloc/bloc/doctor_bloc.dart';
import 'package:fyp/Logic/FavList_bloc/fav_list_bloc.dart';
import 'package:fyp/Logic/Fav_bloc/fav_bloc.dart';
import 'package:fyp/UI/Screens/doctor_profile.dart';
import 'package:sizer/sizer.dart';

class Consultation extends StatefulWidget {
  const Consultation({super.key});

  @override
  State<Consultation> createState() => _ConsultationState();
}

class _ConsultationState extends State<Consultation> {
  callFav() {
    BlocProvider.of<FavListBloc>(context).add(OnFavListLoad());
  }

  @override
  void initState() {
    callFav();
    BlocProvider.of<DoctorBloc>(context).add(OnDoctorLoad());
  }

  var favDocID = [''];
  var favId;
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
          weight: FontWeight.w700,
        ),
        elevation: 0,
      ),
      body: Column(children: [
        BlocListener<FavListBloc, FavListState>(
          listener: (context, state) {
            if (state is FavListLoaded) {
              var def = state.favModel.records;
              setState(() {
                favDocID = def.map((e) => e.id).toList();
              });
              print(favDocID);
            }
          },
          child:
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
                      print('sda${def[index].id}');

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DoctorProfile(
                                name: def[index].name,
                                department:def[index].department ,
                                education: def[index].education,
                                designation: def[index].designation,
                                available: def[index].timing,
                                description: def[index].description,
                            );
                          }));
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 16),
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
                                      width: 35.w,
                                      fit: BoxFit.fitHeight,
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                        return Container(
                                          height: 16.h,
                                          width: 35.w,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: '${def[index].name}',
                                          weight: FontWeight.w600,
                                          fontSize: 13.sp,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.44,
                                          child: CustomText(
                                              text:
                                                  '${def[index].designation} '),
                                        ),

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
                                padding:
                                    const EdgeInsets.only(top: 8.0, right: 8),
                                child: GestureDetector(
                                    onTap: () {

                                         BlocProvider.of<FavBloc>(context)
                                            .add(OnFav(id: def[index].id));
                                         Future.delayed(Duration(milliseconds: 600,),callFav);
                                    },
                                    child: favDocID.contains(def[index].id)
                                        ? Icon(Icons.favorite)
                                        : Icon(Icons.favorite_border_outlined))
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              );
            }

            return Center(child: CircularProgressIndicator.adaptive());
          }),
        )
      ]),
    );
  }
}
