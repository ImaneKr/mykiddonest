// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'dart:developer';

import 'package:appmobile/controller/payment_controller.dart';
import 'package:appmobile/models/payment.dart';
import 'package:appmobile/view/components/paymentTextField.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);
  @override
  State<Payment> createState() => _Payment();
}

class _Payment extends State<Payment> {
  final _formKey = GlobalKey<FormState>();
  bool mealIsChecked = false;
  bool deliveryIsChecked = false;

  Image imageEdahabia = Image.asset('assets/images/edahabia3.png');
  Image imageCib = Image.asset('assets/images/cib.png');

  final guardian_id = Hive.box('guardianData').get('guardian_id');
  final kid_id = Hive.box('selectedKid').get('selectedKid')['kid_id'];

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    addressController.dispose();
    countryController.dispose();
    stateController.dispose();
    super.dispose();
  }

  final PaymentController paymentController = PaymentController();
  int totalAmount = 4000;
  int calculateTotalAmount() {
    int baseAmount = 4000;
    int mealAmount = 500;
    int deliveryAmount = 500;

    int calculatedAmount = baseAmount;

    if (mealIsChecked) {
      calculatedAmount += mealAmount;
    }

    if (deliveryIsChecked) {
      calculatedAmount += deliveryAmount;
    }

    return calculatedAmount;
  }

  void updateTotalAmount() {
    setState(() {
      totalAmount = calculateTotalAmount();
    });
  }

  Future processPayment() async {
    try {
      // Create a customer first
      await paymentController
          .createCustomer(
        name: firstNameController.text + ' ' + lastNameController.text,
        email: emailController.text,
        phone: phoneNumberController.text,
        state: stateController.text,
        address: addressController.text,
      )
          .then((value) async {
        log("customer id is " + value.toString());
        PaymentModel paymentModel = PaymentModel(
          amount: totalAmount,
          guardian_id: guardian_id,
          kid_id: kid_id,
          customerId: value,
        );

        final checkoutData =
            await paymentController.createCheckout(paymentModel);

        final checkoutUrl = checkoutData['checkout_url'];

        await launchUrl(Uri.parse(checkoutUrl));
      });
    } catch (e) {
      log(e.toString());
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('An error occurred while processing the payment.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            AppLocalizations.of(context)!.checkout,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 35,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 380,
                  height: 180,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      // EDAHABIA
                      Container(
                        margin: EdgeInsets.only(left: 50),
                        height: 160,
                        width: 280,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(
                            'assets/images/edahabia3.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // CIB CARD
                      Container(
                        margin: EdgeInsets.only(left: 30),
                        height: 160,
                        width: 280,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(
                            'assets/images/cib.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.totalPrice + ':',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF053C76),
                      ),
                    ),
                    SizedBox(
                      width: 140.0,
                    ),
                    Text(
                      ' $totalAmount DZD',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 340.0,
                  child: Divider(
                    color: Color.fromARGB(255, 197, 197, 197),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                // First Name

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(7.0, 5.0, 7.0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.firstName,
                                style: TextStyle(
                                  color: Color(0xFF01448B),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Container(
                                width: 165,
                                child: PaymentTextField(
                                  controller: firstNameController,
                                  labelText:
                                      AppLocalizations.of(context)!.firstName,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter your first name';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(7.0, 5.0, 7.0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.familyName,
                                style: TextStyle(
                                  color: Color(0xFF01448B),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Container(
                                width: 165,
                                child: PaymentTextField(
                                  controller: lastNameController,
                                  labelText:
                                      AppLocalizations.of(context)!.familyName,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter your last name';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.phoneNumber,
                          style: TextStyle(
                            color: Color(0xFF01448B),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        PaymentTextField(
                          controller: phoneNumberController,
                          labelText: '+213',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter your phone number';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.email,
                          style: TextStyle(
                            color: Color(0xFF01448B),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        PaymentTextField(
                          controller: emailController,
                          labelText: 'example@gmail.com',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter your email adress';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.address,
                          style: TextStyle(
                            color: Color(0xFF01448B),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        PaymentTextField(
                          controller: addressController,
                          labelText:
                              AppLocalizations.of(context)!.address + '..',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter your adress';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(7.0, 0, 7.0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.country,
                                style: TextStyle(
                                  color: Color(0xFF01448B),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Container(
                                width: 165,
                                child: PaymentTextField(
                                  controller: countryController,
                                  labelText:
                                      AppLocalizations.of(context)!.country,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter your adress';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(7.0, 0, 7.0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.state,
                                style: TextStyle(
                                  color: Color(0xFF01448B),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Container(
                                width: 165,
                                child: PaymentTextField(
                                  controller: stateController,
                                  labelText:
                                      AppLocalizations.of(context)!.state,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter your state';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        /* SizedBox(
                          width: 18.0,
                        ),*/ /*
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                        ),*/
                        Text(
                          AppLocalizations.of(context)!
                              .paymentIncludeLunchMealCost,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'DMSans-Regular',
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        /*  SizedBox(
                          width: 10.0,
                        ),*/
                        Checkbox(
                          value: mealIsChecked,
                          onChanged: (bool? newValue) {
                            if (newValue != null) {
                              setState(() {
                                mealIsChecked = newValue;
                              });
                            }
                          },
                          activeColor: Color(0xFF01448B),
                          checkColor: Colors.white,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        /*   Padding(
                          padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                        ),*/
                        Text(
                          AppLocalizations.of(context)!
                              .paymentIncludeDeliveryKidCost,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'DMSans-Regular',
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        /* SizedBox(
                          width: 8.0,
                        ),*/
                        Checkbox(
                          value: deliveryIsChecked,
                          onChanged: (bool? newValue) {
                            if (newValue != null) {
                              setState(() {
                                deliveryIsChecked = newValue;
                              });
                            }
                          },
                          activeColor: Color(0xFF01448B),
                          checkColor: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),

                FilledButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF01448B)),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      updateTotalAmount();
                      processPayment();
                    }
                  },
                  child: Text(
                    AppLocalizations.of(context)!.proceedPayment,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
