import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp/Extracted%20Widgets/const.dart';
import 'package:fyp/Extracted%20Widgets/custom_text.dart';
import 'package:fyp/Logic/Pharmacy_bloc/bloc/pharmacy_bloc.dart';
import 'package:sizer/sizer.dart';

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
            CupertinoSearchTextField(),
            SizedBox(
              height: 1.5.h,
            ),
            Expanded(
              child: BlocBuilder<PharmacyBloc, PharmacyState>(
                builder: (context, state) {
                  if (state is PharmacyInitial) {
                    print('init');
                  } else if (state is PharmacyLoading) {
                    return Center(child: CircularProgressIndicator.adaptive());
                  } else if (state is PharmacyLoaded) {
                    var def = state.pharmacyModel.pharmacy;
                    return GridView.builder(
                        itemCount: def!.length,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          mainAxisExtent: 30.h,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          maxCrossAxisExtent: 280,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                boxShadow: [shadow],
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white),
                            child: Stack(
                              children: [
                                Positioned(
                                    top: 8,
                                    right: 8,
                                    child: Icon(Icons.favorite_border)),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.network(
                                          'https://andrews-health-services-production.up.railway.app/uploads/${def[index].uploadedFile!.path}'),
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
                                                      '${def[index].description}',
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
                        });
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
