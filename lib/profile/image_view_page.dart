import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/profile/profile_presenter.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/user/AuthUser.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/RevButton.dart';
import 'package:hrms/utility/Utility.dart';
import 'package:image_picker/image_picker.dart';

import 'model/profile_response.dart';
import 'model/upload_image_response.dart';
import 'profile_view.dart';

class ImageViewPage extends StatefulWidget {
  String imageUrl;
   ImageViewPage(this.imageUrl,{Key key}) : super(key: key);

  @override
  _ImageViewPagePageState createState() => _ImageViewPagePageState();
}

class _ImageViewPagePageState extends State<ImageViewPage>  {
  final _transformationController = TransformationController();
  TapDownDetails _doubleTapDetails;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.black,
        body: SafeArea(
          child: Column(children: [
            Header(
              headerText: 'Profile',
            ),
            Expanded(
              child: GestureDetector(
                onDoubleTapDown: _handleDoubleTapDown,
                onDoubleTap: _handleDoubleTap,
                child: InteractiveViewer(
                  transformationController: _transformationController,

                  child: Hero(
                    tag: 'image',
                      child: Image.network(widget.imageUrl)),
                ),
              ),
            )
          ]),
        ));
  }
  void _handleDoubleTapDown(TapDownDetails details) {
    _doubleTapDetails = details;
  }
  void _handleDoubleTap() {
    if (_transformationController.value != Matrix4.identity()) {
      _transformationController.value = Matrix4.identity();
    } else {
      final position = _doubleTapDetails.localPosition;
      // For a 3x zoom
      _transformationController.value = Matrix4.identity()
        ..translate(-position.dx * 2, -position.dy * 2)
        ..scale(3.0);
      // Fox a 2x zoom
      // ..translate(-position.dx, -position.dy)
      // ..scale(2.0);
    }
  }
}
