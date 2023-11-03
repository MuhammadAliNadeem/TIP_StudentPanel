import 'package:bright_boost/Screens/Payment/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../Constant.dart';
import '../../Providers/internetConnection.dart';
import '../../Providers/validation_provider.dart';
import '../../Widgets/TextWidget.dart';

class CardScreen extends StatefulWidget {
  CardScreen({super.key, required this.email});
  final String email;
  @override
  State<CardScreen> createState() => _CardScreenState();
}

enum PaymentType { yearly, term }

class _CardScreenState extends State<CardScreen> {
  PaymentType paymentType = PaymentType.yearly;
  RoundedLoadingButtonController buttonController =
      RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
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
            Container(
              height: height,
              width: width,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset("assets/card.png", height: width * 0.2),
                    SizedBox(
                      height: 30,
                    ),
                    TextWidget(title: "Payment Plan", size: 22),
                    SizedBox(
                      height: 20,
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                          unselectedWidgetColor: Colors.white,
                          disabledColor: Colors.blue),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: TextWidget(
                            title: "Yearly Plan - \$5000 AUD: ", size: 18),
                        leading: Radio<PaymentType>(
                          value: PaymentType.yearly,
                          groupValue: paymentType,
                          onChanged: (PaymentType? value) {
                            setState(() {
                              paymentType = value!;
                            });
                            print(paymentType.name);
                          },
                        ),
                        subtitle: TextWidget(
                            title:
                                "Our Yearly Plan offers a fantastic value for avid learners seeking a comprehensive and uninterrupted learning experience. For just \$5000 AUD annually, subscribers gain full access to our extensive library of courses, exclusive content, and premium features. This plan not only provides cost savings compared to monthly options but also ensures a seamless learning journey throughout the year. With automatic renewal and regular content updates, our Yearly Plan is designed to deliver exceptional value and continuous growth for our subscribers.",
                            size: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                          unselectedWidgetColor: Colors.white,
                          disabledColor: Colors.blue),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: TextWidget(
                            title: "Term Plan - \$2500 AUD: ", size: 18),
                        leading: Radio<PaymentType>(
                          value: PaymentType.term,
                          groupValue: paymentType,
                          onChanged: (PaymentType? value) {
                            setState(() {
                              paymentType = value!;
                            });
                            print(paymentType.name);
                          },
                        ),
                        subtitle: TextWidget(
                            title:
                                "Introducing our Term Plan at an affordable \$2500 AUD, ideal for learners seeking flexibility and value. With this plan, users enjoy three months of access to our diverse range of courses and resources. The Term Plan caters to those who prefer a shorter commitment while still reaping the benefits of our e-learning platform. Offering an economical option without compromising on quality, this plan includes the essential features needed for a fulfilling learning experience. Users can choose to renew their subscription at the end of each term, providing the freedom to tailor their learning journey to their schedule and preferences.",
                            size: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PaymentScreen(
                                          email: widget.email,
                                          paymentType: paymentType.name,
                                        )));
                            buttonController.reset();
                          },
                          child: TextWidget(
                            title: "Add card",
                            size: 14,
                            color: Colors.black,
                          )),
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
