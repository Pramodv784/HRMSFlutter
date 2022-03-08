import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:hrms/api_provider/ApiController.dart';
import 'package:hrms/api_provider/endpoints.dart';
import 'package:hrms/profile/profile_view.dart';
import 'package:hrms/profile/model/upload_image_response.dart';
import 'package:hrms/utility/Dialogs.dart';
import 'package:hrms/utility/NetworkCheck.dart';
import 'package:hrms/utility/Utility.dart';

import '../main.dart';
import 'model/profile_response.dart';

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

  getProfile(BuildContext context,int id) async {
    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.get2('${EndPoints.GetProfile}?EmployeeId=$id',headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);

          // final decoded_data = GZipCodec().decode(res.data.bodyBytes);
          //Utility.log('${tag}>>>pramod>>>',decoded_data.first);
          Dialogs.hideLoader(context);
          if(res.statusCode==200)
            {
              ProfileResponse profileResponse=ProfileResponse.fromJson(res.data);
              _view.onProfileFetch(profileResponse);
            }
          else
            {
              _view.onError('some thing went wrong');
            }


        }
        ).catchError((e) async {
          Utility.log(tag, e);
          Dialogs.hideLoader(context);
          //  _view.onError(e);
          // DioErrorParser.parseError(e, _signupView);
        });
    }
  }
  Future<List<ProfileResponse>> getProfiledata(int id) async {
    try {
      Map headers= await Utility.header();
      Map<String, String> headerMap = headers ?? {};
      Response response = await dio.get('${EndPoints.GetProfile}?EmployeeId=$id',
          options: Options(
            contentType: ContentType.json.toString(),
            receiveTimeout: 300000,
            sendTimeout: 300000,
            method: "GET",
            headers: headerMap,
          ));
      print('Api Call *** ${EndPoints.GetProfile}?Id=$id}');
      // if there is a key before array, use this : return (response.data['data'] as List).map((child)=> Children.fromJson(child)).toList();
      print('Response ****${response.data.toString()}');
      return (response.data as List)
          .map((x) => ProfileResponse.fromJson(x))
          .toList();
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }


}
