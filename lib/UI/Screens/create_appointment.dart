import 'package:esewa_pnp/esewa.dart';
import 'package:esewa_pnp/esewa_pnp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp/Extracted%20Widgets/const.dart';
import 'package:fyp/Extracted%20Widgets/textfield.dart';
import 'package:fyp/Logic/CreateAppointment_bloc/bloc/create_appointment_bloc.dart';
import 'package:fyp/Logic/Designation_bloc/designation_bloc.dart';
import 'package:fyp/Logic/Doctor_bloc/bloc/doctor_bloc.dart';
import 'package:fyp/Services/Model/designation_model.dart';
import 'package:fyp/UI/loginandsignup/login.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sizer/sizer.dart';

import '../../Extracted Widgets/custom_text.dart';

class CreateAppointment extends StatefulWidget {
  final name, designation;
  const CreateAppointment({super.key, this.name, this.designation});

  @override
  State<CreateAppointment> createState() => _CreateAppointmentState();
}

class _CreateAppointmentState extends State<CreateAppointment> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController doctorController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController instController = TextEditingController();
  final TextEditingController appointmentController = TextEditingController();

  String refId = '';
  String hasError = '';

  ESewaPnp? _esewaPnp;
  ESewaConfiguration? _configuration;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DoctorBloc>(context).add(OnDoctorLoad());
    BlocProvider.of<DesignationBloc>(context).add(OnDesignationCall());
    _configuration = ESewaConfiguration(
      clientID: "JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R",
      secretKey: "BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==",
      environment: ESewaConfiguration.ENVIRONMENT_TEST,
    );
    _esewaPnp = ESewaPnp(configuration: _configuration!);
    widget.name != null ? doctorController.text = widget.name : '';
    widget.designation != null
        ? designationController.text = widget.designation
        : '';
  }

  String? defDoctor = 'Doctor Name';
  String? defDesignation = 'Designation';
  String? defGender = 'Gender';

  List<String> gender = ['Male', 'Female', 'Other'];

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title: CustomText(
          text: 'Book Appoinment',
          weight: FontWeight.w700,
          color: Colors.white,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocListener<CreateAppointmentBloc, CreateAppointmentState>(
        listener: (context, state) {
          if (state is CreateAppointmentInitial) {
            print('init');
          } else if (state is CreateAppointmentLoading) {
            showDialog(
                barrierDismissible: false,
                barrierColor: Colors.grey.withOpacity(0.2),
                context: context,
                builder: (builder) {
                  return AlertDialog(
                    content: Container(
                      height: 90,
                      width: 170,
                      child: Column(
                        children: [
                          CustomText(text: 'Please Wait'),
                          SizedBox(
                            height: 2.h,
                          ),
                          CircularProgressIndicator()
                        ],
                      ),
                    ),
                  );
                });
          } else if (state is CreateAppointmentLoaded) {
            Navigator.pop(context);
            showSnackBar(context, 'Success', Colors.green, Icons.check,
                'Appointment created successfully');
            Navigator.pop(context);
          } else if (state is CreateAppointmentError) {
            print('error');
            Navigator.pop(context);
            showDialog(
                context: context,
                builder: (builder) {
                  return AlertDialog(
                    title: CustomText(
                      text: 'Alert',
                      fontSize: 14.sp,
                      weight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    ),
                    content: CustomText(
                      text: 'Could not create appointment',
                      textAlign: TextAlign.center,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: CustomText(
                            text: 'OK',
                          )),
                    ],
                  );
                });
          }
        },
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            children: [
              CustomText(
                text: 'Patient Information',
                fontSize: 12.sp,
                weight: FontWeight.w600,
              ),
              SizedBox(
                height: 1.h,
              ),
              CustomTextField(
                controller: nameController,
                hintText: 'Name',
                validator: (value) {
                  if (nameController.text.isEmpty) {
                    return 'Please enter your name';
                  }
                },
              ),
              SizedBox(
                height: 1.2.h,
              ),
              CustomTextField(
                controller: phoneController,
                hintText: "Phone Number",
                keyboardType: TextInputType.number,
                maxLength: 10,
                validator: (value) {
                  if (phoneController.text.isEmpty) {
                    return 'Please enter your phone number';
                  }
                },
              ),
              SizedBox(
                height: 1.2.h,
              ),
              CustomTextField(
                controller: genderController,
                hintText: defGender,
                enabled: false,
                onPress: () {
                  showMaterialModalBottomSheet(
                      context: context,
                      expand: false,
                      builder: (context) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.35,
                          padding: const EdgeInsets.all(16),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: 'Select your gender',
                                      fontSize: 12.sp,
                                      weight: FontWeight.w600,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child:
                                            const Icon(CupertinoIcons.multiply))
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                ListView.builder(
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.all(0),
                                    physics: const ClampingScrollPhysics(),
                                    itemCount: gender.length,
                                    itemBuilder: (context, i) {
                                      return GestureDetector(
                                        onTap: () {
                                          print('tapped');
                                          setState(() {
                                            genderController.text == gender[i];
                                            Navigator.pop(context, gender[i]);
                                          });
                                        },
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(top: 10),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 12),
                                          decoration: BoxDecoration(
                                            color: const Color(0xffEDEDED),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: CustomText(text: gender[i]),
                                        ),
                                      );
                                    })
                              ]),
                        );
                      }).then((value) {
                    setState(() {
                      defGender = value ?? 'Gender';
                    });
                  });
                },
              ),
              SizedBox(
                height: 1.2.h,
              ),
              CustomTextField(
                controller: ageController,
                hintText: 'Age',
                keyboardType: TextInputType.number,
                maxLength: 3,
                validator: (value) {
                  if (ageController.text.isEmpty) {
                    return 'Please enter your age';
                  }
                },
              ),
              SizedBox(
                height: 1.2.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: cityController,
                      hintText: 'City',
                      validator: (value) {
                        if (cityController.text.isEmpty) {
                          return 'Please enter your city';
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Expanded(
                    child: CustomTextField(
                      controller: addressController,
                      hintText: 'Address',
                      validator: (value) {
                        if (addressController.text.isEmpty) {
                          return 'Please enter your address';
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 1.2.h,
              ),
              CustomText(
                text: 'Doctor Information',
                fontSize: 12.sp,
                weight: FontWeight.w600,
              ),
              SizedBox(
                height: 1.2.h,
              ),
              CustomTextField(
                onPress: () {
                  showMaterialModalBottomSheet(
                      context: context,
                      expand: false,
                      builder: (context) {
                        return BlocBuilder<DesignationBloc, DesignationState>(
                          builder: (context, state) {
                            if (state is DesignationLoaded) {
                              var def = state.designationModel.designation;
                              var list = def.map((e) => e.name).toList();
                              return Container(
                                height:
                                MediaQuery.of(context).size.height * 0.55,
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            text: 'Choose a Designation',
                                            fontSize: 12.sp,
                                            weight: FontWeight.w600,
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Icon(
                                                  CupertinoIcons.multiply))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            padding: const EdgeInsets.all(0),
                                            physics:
                                            const ClampingScrollPhysics(),
                                            itemCount: list.length,
                                            itemBuilder: (context, i) {
                                              return GestureDetector(
                                                onTap: () {
                                                  print('tapped');
                                                  setState(() {
                                                    designationController.text ==
                                                        list[i];

                                                    Navigator.pop(
                                                        context, list[i]);
                                                  });
                                                },
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 10),
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 16,
                                                      vertical: 12),
                                                  decoration: BoxDecoration(
                                                    color:
                                                    const Color(0xffEDEDED),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8),
                                                  ),
                                                  child:
                                                  CustomText(text: list[i]),
                                                ),
                                              );
                                            }),
                                      )
                                    ]),
                              );
                            }
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.55,
                              child: const Center(
                                child: CircularProgressIndicator.adaptive(),
                              ),
                            );
                          },
                        );
                      }).then((value) {
                    setState(() {
                      defDesignation = value ?? 'Designation';
                    });
                  });
                },
                validator: (value) {
                  if (nameController.text.isEmpty) {
                    return 'Please enter the designation';
                  }
                },
                enabled: false,
                controller: designationController,
                hintText: defDesignation,
              ),
              SizedBox(
                height: 1.2.h,
              ),
              CustomTextField(
                onPress: () {
                  if(defDesignation == 'Designation'){
                    print ('No Designation');
                  }else{
                    showMaterialModalBottomSheet(
                        context: context,
                        expand: false,
                        builder: (context) {
                          return BlocBuilder<DoctorBloc, DoctorState>(
                            builder: (context, state) {
                              if (state is DoctorLoaded) {
                                var def = state.doctorModel.doctors;
                                var list = def.map((e) => e.name).toList();
                                var desList = def.map((e) => e.designation).toList();
                                print(desList);
                                print(defDesignation);
                                return Container(
                                  height:
                                  MediaQuery.of(context).size.height * 0.55,
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText(
                                              text: 'Choose a Doctor',
                                              fontSize: 12.sp,
                                              weight: FontWeight.w600,
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Icon(
                                                    CupertinoIcons.multiply))
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Expanded(
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              padding: const EdgeInsets.all(0),
                                              physics:
                                              const ClampingScrollPhysics(),
                                              itemCount: list.length,
                                              itemBuilder: (context, i) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    print('tapped');
                                                    setState(() {
                                                      doctorController.text ==
                                                          list[i];
                                                      Navigator.pop(
                                                          context, list[i]);
                                                    });
                                                  },
                                                  child:  desList[i] == defDesignation?Container(
                                                    margin: const EdgeInsets.only(
                                                        top: 10),
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 16,
                                                        vertical: 12),
                                                    decoration: BoxDecoration(
                                                      color:
                                                      const Color(0xffEDEDED),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8),
                                                    ),
                                                    child:

                                                    CustomText(text: list[i]),
                                                  ):Container(),
                                                );
                                              }),
                                        )
                                      ]),
                                );
                              }
                              return Container(
                                height: MediaQuery.of(context).size.height * 0.55,
                                child: const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                ),
                              );
                            },
                          );
                        }).then((value) {
                      setState(() {
                        defDesignation == 'Designation'?defDoctor = 'Doctor Name':
                        defDoctor = value ?? 'Doctor Name';
                      });
                    });
                  }
                },
                enabled: false,
                controller: doctorController,
                hintText: defDoctor,
              ),
              SizedBox(
                height: 1.2.h,
              ),
              CustomTextField(
                controller: instController,
                hintText: 'Instructions',
                validator: (value) {
                  if (nameController.text.isEmpty) {
                    return 'Please enter your instructions';
                  }
                },
              ),
              SizedBox(
                height: 1.2.h,
              ),
              CustomTextField(
                onPress: () async {
                  DateTime? _selectedDateTime = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2030),
                  );
                  setState(() {
                    if (_selectedDateTime == null) {
                      print("exception handled");
                    } else {
                      appointmentController.text = _selectedDateTime
                          .toString()
                          .substring(
                              0, _selectedDateTime.toString().indexOf(' '));
                    }
                  });
                },
                enabled: false,
                controller: appointmentController,
                hintText: 'Appointment Date',
              ),
              SizedBox(
                height: 1.2.h,
              ),
              LoginButton(
                  text: 'Pay with Esewa',
                  color: Colors.blue,
                  onTap: () async {
                    ESewaPayment _payment = ESewaPayment(
                        amount: 10.0,
                        productName: "TRY",
                        productID: "ABC123",
                        callBackURL: "xyz.com");

                    try {
                      final _res =
                          await _esewaPnp!.initPayment(payment: _payment);
                      // Handle success
                    } on ESewaPaymentException catch (e) {
                      // Handle error
                    }
                  }),
              SizedBox(height: 1.2.h),
              LoginButton(
                  text: 'BOOK',
                  color: Colors.green,
                  onTap: () {
                    print(genderController.text);
                    if (_formKey.currentState!.validate()) {
                      BlocProvider.of<CreateAppointmentBloc>(context).add(
                          OnCreateAppointment(
                              name: nameController.text,
                              phone: phoneController.text,
                              gender: defGender,
                              age: ageController.text,
                              city: cityController.text,
                              address: addressController.text,
                              doctorName: defDoctor,
                              designation:defDesignation,
                              instructions: instController.text,
                              appointmentDate: appointmentController.text));
                    }
                    ;
                  })
            ],
          ),
        ),
      ),
    );
  }
}
