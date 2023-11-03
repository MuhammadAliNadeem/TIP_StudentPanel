import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

Widget dpEditDialogue({
  VoidCallback? onTapGallery,
  VoidCallback? onTapCamera,
  VoidCallback? onTapCancel,
}) {
  return Container(
    padding: const EdgeInsets.only(top: 8),
    height: 172,
    child: Column(
      children: [
        ///camera and gallery
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              //gallery
              ListTile(
                onTap: onTapGallery,
                contentPadding: const EdgeInsets.only(left: 17, top: 7),
                minVerticalPadding: 0,
                dense: true,
                visualDensity: const VisualDensity(
                  vertical: -3,
                ),
                leading: const Icon(
                  Remix.image_fill,
                  size: 20,
                ),
                title: const Text(
                  'Choose Photo From Galley',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),

              //divider
              const Divider(
                thickness: 0.3,
              ),

              //camera
              ListTile(
                onTap: onTapCamera,
                contentPadding: const EdgeInsets.only(left: 17, bottom: 5),
                minVerticalPadding: 0,
                dense: true,
                visualDensity: const VisualDensity(
                  vertical: -3,
                ),
                leading: const Icon(
                  Remix.camera_fill,
                  size: 20,
                ),
                title: const Text(
                  'Click a Photo',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),

        //space
        const SizedBox(
          height: 8,
        ),

        ///cancel button
        InkWell(
          onTap: onTapCancel,
          child: Container(
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ),
      ],
    ),
  );
}
