import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../Constant.dart';

Widget LeadShimmerWidget() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Shimmer(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 7,vertical: 15),
          decoration: BoxDecoration(
            color: Colors.transparent,
          
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.white,
              width: 1.5,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //leading widget
              SizedBox(
                width: width * 0.12,
                child: const CircleAvatar(
                  radius: 22,
                  backgroundColor: Color(0XFFe0e0e0),
                ),
              ),
      
              //space
              const SizedBox(
                width: 16,
              ),
      
              //title widget and subtitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //title
                  Container(
                    width: width * 0.2,
                    height: 14,
                    color: Color(0XFFe0e0e0),
                  ),
      
                  //space
                  const SizedBox(
                    height: 5,
                  ),
      
                  //subtitle
                  Container(
                    width: width * 0.4,
                    height: 14,
                    color: Color(0XFFe0e0e0),
                  ),
                ],
              ),
      
              //right corner
              const Spacer(),
      
             
            ],
          ),
        ),
      ),
    ),
  );
}
