import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:hrms/api_provider/ApiController.dart';
import 'package:hrms/api_provider/endpoints.dart';
import 'package:hrms/profile/profile_view.dart';
import 'package:hrms/profile/upload_image_response.dart';
import 'package:hrms/utility/Dialogs.dart';
import 'package:hrms/utility/NetworkCheck.dart';
import 'package:hrms/utility/Utility.dart';

class ProfilePresenter {
  var tag = 'ProfilePresenter ';
  static const encryptionChannel = const MethodChannel('enc/dec');


  ProfileView _view;
  ApiController _repository = ApiController.getInstance();

  ProfilePresenter(this._view);




  uploadImage(BuildContext context, File imageToUpload) async {
    if (await NetworkCheck.check()) {
      String fileName = imageToUpload.path.split('/').last;
      print(fileName);
      print(imageToUpload.path);
      FormData formData = FormData.fromMap({
        "File": await MultipartFile.fromFile(imageToUpload.path,
            filename: fileName),
      });
      Dialogs.showLoader(context, 'Please wait while uploading image',
          'Uploading Profile Pic');

      _repository.post('${EndPoints.ImageUpload}?FolderName=uploadImage',
        body: formData,)
        ..then((Response res) async {
          Utility.log(tag, res);
          UploadImageResponse uploadImageResponse =
          UploadImageResponse.fromJson(res.data);
          Dialogs.hideLoader(context);
         // if (uploadImageResponse?.data?.flag??false) {
            _view.onImageUpload(uploadImageResponse);
            // if (_view is EditProfileView) {
            //   EditProfileView _profileView = _view as EditProfileView;
            //   _profileView.onInstantUploaded(uploadProfileResponse);
            // }
         /* } else {
            _view.onError(uploadImageResponse.errorMessage);
          }*/
        })
        ..catchError((e) {
          Dialogs.hideLoader(context);
         // _view.onError(e.message);
        });
    }
  }




}
