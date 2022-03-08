
import 'package:hrms/profile/model/upload_image_response.dart';

import '../base/base_view.dart';
import 'model/profile_response.dart';

abstract class ProfileView extends BaseView  {

  void onImageUpload(UploadImageResponse response);
  void onProfileFetch(ProfileResponse response);



}