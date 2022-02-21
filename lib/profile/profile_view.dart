
import 'package:hrms/profile/model/upload_image_response.dart';

import 'model/profile_response.dart';

abstract class ProfileView   {

  void onImageUpload(UploadImageResponse response);
  void onProfileFetch(ProfileResponse response);
  void onProfileListFetch(List<ProfileResponse> responselist);


}