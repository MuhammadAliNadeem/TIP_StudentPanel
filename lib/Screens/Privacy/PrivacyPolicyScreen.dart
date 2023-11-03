import 'package:bright_boost/Widgets/DrawerWidget.dart';
import 'package:bright_boost/Widgets/TextWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Constant.dart';
import '../../Providers/validation_provider.dart';

class PrivacypolicyScreen extends StatefulWidget {
  const PrivacypolicyScreen({super.key});

  @override
  State<PrivacypolicyScreen> createState() => _PrivacypolicyScreenState();
}

class _PrivacypolicyScreenState extends State<PrivacypolicyScreen> {
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<ValidationProvider>(
      builder: (context, value, child) => SafeArea(
        child: Scaffold(
          key: _scaffoldState,
          drawer: DrawerWidget(),
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
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  const    SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                                onPressed: () {
                                  _scaffoldState.currentState!.openDrawer();
                                },
                                icon:const Icon(
                                  Icons.menu,
                                )),
                          ),
                          TextWidget(
                              title: "Privacy Policy",
                              size: 20,
                              fontWeight: FontWeight.w400),
                          Opacity(
                            opacity: 0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                  onPressed: () {},
                                  icon:const Icon(
                                    Icons.menu,
                                  )),
                            ),
                          ),
                        ],
                      ),
                   const   SizedBox(
                        height: 40,
                      ),
                      TextWidget(
                          title:
                              "Privacy Policy for Bright Boost E-Learning App",
                          size: 18,
                          fontWeight: FontWeight.w600),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title: "Effective Date: 31-09-2023",
                          size: 16,
                          fontWeight: FontWeight.w600),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title:
                              "Thank you for choosing Bright Boost, our e-learning app designed to enhance your learning experience. This Privacy Policy outlines how we collect, use, disclose, and protect your personal information. By using the Bright Boost app, you agree to the terms outlined in this Privacy Policy.",
                          size: 14,
                          fontWeight: FontWeight.w400),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title: "Information We Collect:",
                          size: 16,
                          fontWeight: FontWeight.w600),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title: "1. Personal Information:",
                          size: 14,
                          fontWeight: FontWeight.w600),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title:
                              "During the account creation process, we collect your name, email address, and password.\nOptionally, you may provide additional information such as a profile picture or other details to personalize your account.",
                          size: 14,
                          fontWeight: FontWeight.w400),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title: "2. Usage Data:",
                          size: 14,
                          fontWeight: FontWeight.w600),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title:
                              "We automatically collect information about your interactions with the app, including pages visited, time spent, and features used.",
                          size: 14,
                          fontWeight: FontWeight.w400),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title: "3. Device Information:",
                          size: 14,
                          fontWeight: FontWeight.w600),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title:
                              "We may collect information about your device, including device type, operating system, and unique device identifiers.",
                          size: 14,
                          fontWeight: FontWeight.w400),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title: "4. Payment Information:",
                          size: 14,
                          fontWeight: FontWeight.w600),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title:
                              "If you make in-app purchases, our third-party payment processor collects the necessary payment information. We do not store this information on our servers.",
                          size: 14,
                          fontWeight: FontWeight.w400),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title: "5. Communications:",
                          size: 14,
                          fontWeight: FontWeight.w600),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title:
                              "We collect information when you contact us for support or feedback, including your email address and the content of your communication.",
                          size: 14,
                          fontWeight: FontWeight.w400),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title: "How We Use Your Information:",
                          size: 16,
                          fontWeight: FontWeight.w600),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title: "1. Personalization:",
                          size: 14,
                          fontWeight: FontWeight.w600),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title:
                              "We use your information to personalize your learning experience, such as recommending courses or content based on your preferences.",
                          size: 14,
                          fontWeight: FontWeight.w400),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title: "2. Account Management:",
                          size: 14,
                          fontWeight: FontWeight.w600),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title:
                              "Your information is used to manage your account, including account verification, password recovery, and communication related to your account.",
                          size: 14,
                          fontWeight: FontWeight.w400),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title: "3. Analytics:",
                          size: 14,
                          fontWeight: FontWeight.w600),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title:
                              "We use aggregated and anonymized data for analytics purposes to improve our app's functionality and user experience.",
                          size: 14,
                          fontWeight: FontWeight.w400),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title: "4. Communication:",
                          size: 14,
                          fontWeight: FontWeight.w600),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title:
                              "We may use your email address to send important updates, announcements, and notifications related to the app. You can opt-out of non-essential communications.",
                          size: 14,
                          fontWeight: FontWeight.w400),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title: "5. Customer Support:",
                          size: 14,
                          fontWeight: FontWeight.w600),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title:
                              "Your information may be used to provide customer support and address inquiries or issues you may have.",
                          size: 14,
                          fontWeight: FontWeight.w400),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title: "Information Sharing:",
                          size: 16,
                          fontWeight: FontWeight.w600),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title: "1. Third-Party Service Providers:",
                          size: 14,
                          fontWeight: FontWeight.w600),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title:
                              "We may share your information with third-party service providers that help us with app development, hosting, analytics, and payment processing.",
                          size: 14,
                          fontWeight: FontWeight.w400),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title: "2. Legal Compliance:",
                          size: 14,
                          fontWeight: FontWeight.w600),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title:
                              "We may disclose your information if required by law or in response to a valid legal request.",
                          size: 14,
                          fontWeight: FontWeight.w400),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title: "Security: ",
                          size: 16,
                          fontWeight: FontWeight.w600),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title:
                              "We employ industry-standard security measures to protect your information from unauthorized access, disclosure, alteration, and destruction.",
                          size: 14,
                          fontWeight: FontWeight.w400),
                     const SizedBox(
                        height: 10,
                      ),
                       TextWidget(
                          title: "Your Choices:",
                          size: 16,
                          fontWeight: FontWeight.w600),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title:
                              "You can review and update your account information at any time.\nYou may opt-out of non-essential communications.\nYou can delete your account, which will permanently erase your personal information from our system.",
                          size: 14,
                          fontWeight: FontWeight.w400),
                     const SizedBox(
                        height: 10,
                      ),
                        TextWidget(
                          title: "Children's Privacy:",
                          size: 16,
                          fontWeight: FontWeight.w600),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title:
                              "Bright Boost is intended for users aged 13 and above. We do not knowingly collect personal information from children under 13.",
                          size: 14,
                          fontWeight: FontWeight.w400),
                     const SizedBox(
                        height: 10,
                      ),
                         TextWidget(
                          title: "Changes to Privacy Policy:",
                          size: 16,
                          fontWeight: FontWeight.w600),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title:
                              "We may update this Privacy Policy from time to time. Any changes will be effective upon posting the revised policy.",
                          size: 14,
                          fontWeight: FontWeight.w400),
                     const SizedBox(
                        height: 10,
                      ),
                        TextWidget(
                          title: "Contact Us:",
                          size: 16,
                          fontWeight: FontWeight.w600),
                     const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          title:
                              "If you have any questions or concerns about this Privacy Policy, please contact us at [support@brightboost.com].\nThank you for choosing Bright Boost! Happy learning!",
                          size: 14,
                          fontWeight: FontWeight.w400),
                     const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
