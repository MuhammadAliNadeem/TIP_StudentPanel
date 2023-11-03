import 'dart:async';
import 'package:bright_boost/Widgets/loading_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:remixicon/remixicon.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../Constant.dart';
import '../../Providers/internetConnection.dart';
import '../../Providers/validation_provider.dart';
import '../../Widgets/FlushBarWidget.dart';
import '../../Widgets/TextFormWidget.dart';
import '../../Widgets/TextWidget.dart';
import '../../Widgets/cashback_dialogue.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({super.key, required this.email, required this.paymentType});
  final String email;
  final String paymentType;
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  RoundedLoadingButtonController buttonController =
      RoundedLoadingButtonController();
  TextEditingController bankName = TextEditingController();
  TextEditingController accountHolderName = TextEditingController();
  TextEditingController accountNo = TextEditingController();
  TextEditingController cvc = TextEditingController();
  TextEditingController expireDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Consumer2<ValidationProvider, internetConnectionProvider>(
      builder: (context, value, internet, child) => Scaffold(
        body: Stack(
          children: [
            Image.asset(
              "assets/background.png",
              height: height,
              width: width,
              fit: BoxFit.fill,
            ),
            Form(
              key: _formKey,
              child: Container(
                height: height,
                width: width,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80,
                      ),
                      // Lottie.asset("assets/lottie/kyc.json",
                      //     width: width * 0.7),
                      SizedBox(
                        height: 30,
                      ),
                      TextWidget(
                        title: "Add Bank Details",
                        size: 24,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      textfieldProduct(
                          context: context,
                          name: "Bank Name",
                          controller: bankName,
                          suffixIcon: Icon(
                            Remix.bank_line,
                            color: Colors.white,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      textfieldProduct(
                          context: context,
                          name: "Account Holder Name",
                          controller: accountHolderName,
                          suffixIcon: Icon(
                            Icons.person_2_outlined,
                            color: Colors.white,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      textfieldProduct(
                          context: context,
                          name: "Account No",
                          controller: accountNo,
                          maxlength: 16,
                          inputtype: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          suffixIcon: Icon(
                            Remix.numbers_line,
                            color: Colors.white,
                          )),
                      textfieldProduct(
                          context: context,
                          name: "CVC",
                          controller: cvc,
                          maxlength: 3,
                          inputtype: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          suffixIcon: Icon(
                            Icons.pin_outlined,
                            color: Colors.white,
                          )),
                      textfieldProduct(
                          context: context,
                          name: "Expire Date",
                          controller: expireDate,
                          suffixIcon: Icon(
                            Remix.time_line,
                            color: Colors.white,
                          )),
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: width * 0.6,
                        child: RoundedLoadingButton(
                            valueColor: Colors.black,
                            color: Colors.white,
                            controller: buttonController,
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                showDialog(
                                    context: context,
                                    builder: (context) => loadingDialogue());
                                await value.mUpdatePayment(
                                  bankName: bankName.text,
                                  accountHolderName: accountHolderName.text,
                                  accountNo: accountNo.text,
                                  cvc: cvc.text,
                                  expireDate: expireDate.text,
                                  paymentType: widget.paymentType,
                                );
                                buttonController.success();
                                Navigator.pop(context);
                                SuccessFlushbar(
                                    context,
                                    "Payment",
                                    widget.paymentType == "term"
                                        ? "Your term plan have successfull active"
                                        : "Your yealry plan have successfull active");
                                Timer(Duration(seconds: 2), () {
                                  showDialog<String>(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) => cashbackDialogue(
                                          paymentType: widget.paymentType));

                                  buttonController.reset();
                                });
                              } else {
                                buttonController.error();
                                Timer(Duration(seconds: 2), () {
                                  buttonController.reset();
                                });
                              }
                            },
                            child: TextWidget(
                              title: widget.paymentType == "term"
                                  ? "Pay Now \$2500.00"
                                  : "Pay Now \$5000.00",
                              size: 14,
                              color: Colors.black,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
