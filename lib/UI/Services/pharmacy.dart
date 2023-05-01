import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp/Extracted%20Widgets/const.dart';
import 'package:fyp/Extracted%20Widgets/custom_text.dart';
import 'package:fyp/Logic/Pharmacy_bloc/bloc/pharmacy_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../Extracted Widgets/textfield.dart';

class Pharmacy extends StatefulWidget {
  const Pharmacy({super.key});

  @override
  State<Pharmacy> createState() => _PharmacyState();
}

class _PharmacyState extends State<Pharmacy> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<PharmacyBloc>(context).add(OnPharmacyLoad());
  }
  final TextEditingController searchController = TextEditingController();
  List<dynamic> _search = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorGrey,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.blue.shade300,
        title: CustomText(
          text: 'Pharmacy',
          color: Colors.white,
          fontSize: 12.sp,
          weight: FontWeight.w700,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            Expanded(
              child: BlocBuilder<PharmacyBloc, PharmacyState>(
                builder: (context, state) {
                  if (state is PharmacyInitial) {
                    print('init');
                  } else if (state is PharmacyLoading) {
                    return Center(child: CircularProgressIndicator.adaptive());
                  } else if (state is PharmacyLoaded) {
                    var def = state.pharmacyModel.pharmacy;
                    void searchSites(
                        String text) {
                      _search.clear();
                      if (text.isEmpty) {
                        setState(() {});
                        return;
                      } else {
                        state.pharmacyModel
                            .pharmacy
                            ?.forEach(
                                (searchDetails) {
                              if (searchDetails
                                  .medicineName!
                                  .toLowerCase()
                                  .contains(text
                                  .toLowerCase())) {
                                _search.add(
                                    searchDetails);
                              }
                            });
                        setState(() {});
                      }
                    }
                    return Column(
                      children: [
                        CustomTextField(
                            controller: searchController,
                            hintText: 'Search',
                            fillColor: Colors.white,
                            onChange:  (String query) {
                              searchSites(query);}
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Expanded(
                          child: _search.isEmpty? GridView.builder(
                              itemCount: def!.length,
                              shrinkWrap: true,
                              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                mainAxisExtent: 38.h,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                maxCrossAxisExtent: 280,
                              ),
                              itemBuilder: (context, index) {
                                return  Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [shadow],
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white),
                                  child: Stack(
                                    children: [

                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft: Radius.circular(12)),
                                              child: Image.network(
                                                  'https://andrew-dipeshshtha4.b4a.run/uploads/${def[index].uploadedFile!.path}',
                                                height:20.h,errorBuilder: (BuildContext context,
                                                  Object exception, StackTrace? stackTrace) {
                                                return Container(
                                                  height:20.h,
                                                  width: double.infinity,
                                                  color: Colors.grey,
                                                  child: Icon(
                                                    Icons.error,
                                                    color: Colors.white,
                                                  ),
                                                );
                                              },),
                                            ),
                                            Divider(
                                              color: Colors.grey,
                                              thickness: 0.8,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomText(
                                                    text:
                                                        '${def[index].medicineName}',
                                                    fontSize: 12.sp,
                                                    weight: FontWeight.w600,
                                                  ),
                                                  CustomText(
                                                    text:
                                                        'Exp. date ${def[index].expiryDate}',
                                                    fontSize: 9.sp,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      CustomText(
                                                        text:
                                                            '${def[index].description?.substring(0,8)}',
                                                        fontSize: 9.sp,
                                                      ),
                                                      CustomText(
                                                        text:
                                                            'Rs. ${def[index].price}',
                                                        fontSize: 9.sp,
                                                        color: Colors.blue,
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          ]),

                                    ],
                                  ),
                                );
                              }):GridView.builder(
                              itemCount: _search.length,
                              shrinkWrap: true,
                              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                mainAxisExtent: 38.h,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                maxCrossAxisExtent: 280,
                              ),
                              itemBuilder: (context, index) {
                                return  Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [shadow],
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white),
                                  child: Stack(
                                    children: [

                                      Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft: Radius.circular(12)),
                                              child: Image.network(
                                                'https://andrews-health-services-production.up.railway.app/uploads/${_search[index].uploadedFile!.path}',
                                                height:20.h,errorBuilder: (BuildContext context,
                                                  Object exception, StackTrace? stackTrace) {
                                                return Container(
                                                  height:20.h,
                                                  width: double.infinity,
                                                  color: Colors.grey,
                                                  child: Icon(
                                                    Icons.error,
                                                    color: Colors.white,
                                                  ),
                                                );
                                              },),
                                            ),
                                            Divider(
                                              color: Colors.grey,
                                              thickness: 0.8,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  CustomText(
                                                    text:
                                                    '${_search[index].medicineName}',
                                                    fontSize: 12.sp,
                                                    weight: FontWeight.w600,
                                                  ),
                                                  CustomText(
                                                    text:
                                                    'Exp. date ${_search[index].expiryDate}',
                                                    fontSize: 9.sp,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      CustomText(
                                                        text:
                                                        '${_search[index].description?.substring(0,8)}',
                                                        fontSize: 9.sp,
                                                      ),
                                                      CustomText(
                                                        text:
                                                        'Rs. ${_search[index].price}',
                                                        fontSize: 9.sp,
                                                        color: Colors.blue,
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          ]),

                                    ],
                                  ),
                                );
                              }) ,
                        ),
                      ],
                    );
                  }
                  return Center(child: CircularProgressIndicator.adaptive());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
