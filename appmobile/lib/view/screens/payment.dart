// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:appmobile/view/components/paymentTextField.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);
  @override
  State<Payment> createState() => _Payment();
}

class _Payment extends State<Payment> {
  final _formKey = GlobalKey<FormState>();
  bool mealIsChecked = false;
  bool deliveryIsChecked = false;

  String selectedOption = 'edahabia';

  Image imageEdahabia = Image.asset('assets/images/edahabia3.png');
  Image imageCib = Image.asset('assets/images/cib.png');

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController adressController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateController = TextEditingController();

  void dispose() {
    // Dispose of the controllers when the widget is removed
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    countryController.dispose();
    stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Checkout',
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
                      'Total price:',
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
                      '4000.0DA',
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
                                'First name',
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
                                  labelText: 'First Name',
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
                                'Last name',
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
                                  labelText: 'Last name',
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
                          'Phone Number',
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
                          'Adress',
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
                          controller: adressController,
                          labelText: 'adress..',
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
                                'Country',
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
                                  labelText: 'country',
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
                                'State',
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
                                  labelText: 'State',
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
                          'Payment includes lunch meal cost',
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
                          'Payment includes delivery kid cost',
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
                    if (_formKey.currentState!.validate()) {}
                  },
                  child: Text(
                    'Proceed payment',
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
