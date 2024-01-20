class LoginWithGoogleModel {

  late String tokenType;
  late int expiresIn;
  late String accessToken;



  LoginWithGoogleModel.fromJson(Map<String, dynamic> json) {
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    accessToken = json['access_token'];
  }


}


