import 'package:bright_boost/Models/TeacherModel.dart';
import 'package:bright_boost/Providers/TeacherProvider.dart';
import 'package:bright_boost/Screens/Detail/TeacherDetailsScreen.dart';
import 'package:bright_boost/Widgets/DrawerWidget.dart';
import 'package:bright_boost/Widgets/TextWidget.dart';
import 'package:bright_boost/Widgets/TutorShimmer.dart';
import 'package:bright_boost/Widgets/lead_shimmer_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Constant.dart';
import '../../Models/carousel_slider_model.dart';
import '../../Providers/validation_provider.dart';

List<CarouselSliderModel> sliderList = [
  CarouselSliderModel(
    imagePath: 'assets/1.jpeg',
  ),
  CarouselSliderModel(
    imagePath: 'assets/2.jpeg',
  ),
  CarouselSliderModel(
    imagePath: 'assets/3.jpeg',
  ),
  CarouselSliderModel(
    imagePath: 'assets/4.jpeg',
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TeacherProvider>(context, listen: false).mGetTeacher();
    Provider.of<TeacherProvider>(context, listen: false).mGetTeacherSubject();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ValidationProvider, TeacherProvider>(
      builder: (context, value, TP, child) => SafeArea(
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
                    children: [
                      SizedBox(
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
                                icon: Icon(
                                  Icons.menu,
                                )),
                          ),
                          TextWidget(
                              title: "HOMESCREEN",
                              size: 20,
                              fontWeight: FontWeight.w400),
                          Opacity(
                            opacity: 0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.menu,
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CarouselSlider.builder(
                        itemCount: sliderList.length,
                        options: CarouselOptions(
                          aspectRatio: 16 / 9,
                          height:350,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 1000),
                          enlargeCenterPage: true,
                          enlargeFactor: 0.4,
                          scrollDirection: Axis.horizontal,
                        ),
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 204, 197, 197),
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  '${sliderList[itemIndex].imagePath}'),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextWidget(
                        title: "TUTOR",
                        size: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Wrap(
                          spacing: 13,
                          runSpacing: 13,
                          children: TP.valueTeacher == false
                              ? List.generate(5, (index) => TutorShimmer())
                              : List.generate(
                                  TP.teacherModel.length,
                                  (index) => GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailScreenTeacher(
                                                        model: TP.teacherModel[
                                                            index])));
                                      },
                                      child: TutorWidget(
                                          model: TP.teacherModel[index]))),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextWidget(
                        title: "SUBJECTS",
                        size: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: TP.valueTeacherSubject == false
                            ? List.generate(5, (index) => LeadShimmerWidget())
                            : List.generate(
                                TP.teacherModelSubject.length,
                                (index) => GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailScreenTeacher(
                                                        model:
                                                            TP.teacherModelSubject[
                                                                index])));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(0.5)),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                "${TP.teacherModelSubject[index].imageUrl}"),
                                          ),
                                          title: TextWidget(
                                              title:
                                                  "${TP.teacherModelSubject[index].name}",
                                              size: 16,
                                              fontWeight: FontWeight.w500),
                                          subtitle: TextWidget(
                                              title:
                                                  "${TP.teacherModelSubject[index].subject.toString().replaceAll("[", "").replaceAll("]", "")}",
                                              size: 14,
                                              fontWeight: FontWeight.w400),
                                          trailing: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    )),
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

Widget TutorWidget({required TeacherModel model}) {
  return Column(
    children: [
      CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(model.imageUrl!),
      ),
      SizedBox(
        height: 5,
      ),
      TextWidget(title: model.name!, size: 14, fontWeight: FontWeight.w500)
    ],
  );
}
