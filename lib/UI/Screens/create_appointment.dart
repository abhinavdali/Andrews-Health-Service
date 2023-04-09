import 'package:esewa_flutter/esewa_flutter.dart';
import 'package:esewa_pnp/esewa.dart';
import 'package:esewa_pnp/esewa_pnp.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Extracted%20Widgets/const.dart';
import 'package:fyp/Extracted%20Widgets/textfield.dart';
import 'package:fyp/UI/loginandsignup/login.dart';
import 'package:sizer/sizer.dart';

import '../../Extracted Widgets/custom_text.dart';

class CreateAppointment extends StatefulWidget {
  const CreateAppointment({super.key});

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

    _configuration = ESewaConfiguration(
      clientID: "JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R",
      secretKey: "BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==",
      environment: ESewaConfiguration.ENVIRONMENT_TEST,
    );
    _esewaPnp = ESewaPnp(configuration: _configuration!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomText(
          text: 'Book Appoinment',
          weight: FontWeight.w600,
          color: Colors.white,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: [
          CustomText(text: 'Patient Information',fontSize: 12.sp,weight: FontWeight.w600,),
          SizedBox(height: 1.h,),
          CustomTextField(
            controller: nameController,
            hintText: 'Name',
          ),

          SizedBox(
            height: 1.2.h,
          ),
          CustomTextField(
            controller: phoneController,
            hintText: "Phone Number",
          ),
          SizedBox(
            height: 1.2.h,
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: genderController,
                  hintText: 'Gender',
                ),
              ),
              SizedBox(width: 2.w,),
              Expanded(
                child: CustomTextField(
                  controller: ageController,
                  hintText: 'Age',
                ),
              ),
            ],
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
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              Expanded(
                child: CustomTextField(
                  controller: addressController,
                  hintText: 'Address',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 1.2.h,
          ),
          CustomText(text: 'Doctor Information',fontSize: 12.sp,weight: FontWeight.w600,),
          SizedBox(
            height: 1.2.h,
          ),
          CustomTextField(
            onPress: (){},
            enabled: false,
            controller: doctorController,
            hintText: 'Doctor Name',
          ),  SizedBox(
            height: 1.2.h,
          ),
          CustomTextField(
            onPress: (){},
            enabled: false,
            controller: designationController,
            hintText: 'Designation',
          ),  SizedBox(
            height: 1.2.h,
          ),
          CustomTextField(
            controller: instController,
            hintText: 'Instructions',
          ),
          SizedBox(
            height: 1.2.h,
          ),
          CustomTextField(
            onPress: (){},
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
                  final _res = await _esewaPnp!.initPayment(payment: _payment);
                  // Handle success
                } on ESewaPaymentException catch (e) {
                  // Handle error
                }
              })
        ],
      ),
    );
  }
}
