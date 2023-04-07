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
          CustomTextField(
            controller: nameController,
            hintText: 'Name',
          ),
          SizedBox(
            height: 1.2.h,
          ),
          CustomTextField(
            onPress: () {},
            enabled: false,
            controller: nameController,
            hintText: 'Doctor Name',
          ),
          SizedBox(
            height: 1.2.h,
          ),
          CustomTextField(
            controller: nameController,
            hintText: 'Designation',
          ),
          SizedBox(
            height: 1.2.h,
          ),
          CustomTextField(
            controller: nameController,
            hintText: "Phone Number",
          ),
          SizedBox(
            height: 1.2.h,
          ),
          CustomTextField(
            controller: nameController,
            hintText: 'Gender',
          ),
          SizedBox(
            height: 1.h,
          ),
          CustomTextField(
            controller: nameController,
            hintText: 'Age',
          ),
          SizedBox(
            height: 1.2.h,
          ),
          CustomTextField(
            controller: nameController,
            hintText: 'City',
          ),
          SizedBox(
            height: 1.2.h,
          ),
          CustomTextField(
            controller: nameController,
            hintText: 'Address',
          ),
          SizedBox(
            height: 1.h,
          ),
          CustomTextField(
            controller: nameController,
            hintText: 'Instructions',
          ),
          SizedBox(
            height: 1.2.h,
          ),
          CustomTextField(
            controller: nameController,
            hintText: 'Appointment Date',
          ),
          SizedBox(
            height: 1.2.h,
          ),
          // EsewaPayButton(
          //   paymentConfig: ESewaConfig.dev(
          //       su: 'https://www.marvel.com/hello',
          //       amt: 10,
          //       fu: 'https://www.marvel.com/hello',
          //       pid: '1212',
          //       scd: 'EPAYTEST'),
          //   width: 100,
          //   onFailure: (result) async {
          //     setState(() {
          //       refId = '';
          //       hasError = result;
          //     });
          //     if (kDebugMode) {
          //       print(result);
          //     }
          //   },
          //   onSuccess: (result) async {
          //     setState(() {
          //       hasError = '';
          //       refId = result.refId!;
          //     });
          //     if (kDebugMode) {
          //       print(result.toJson());
          //     }
          //   },
          // ),
          // if (refId.isNotEmpty)
          //   Text('Console: Payment Success, Ref Id: $refId'),
          // if (hasError.isNotEmpty)
          //   Text('Console: Payment Failed, Message: $hasError'),
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
