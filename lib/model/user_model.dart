class UserModel {

  String? userId ;
  String? userName ;
  String? userEmail ;
  String? userPic ;

  UserModel({
    this.userId,
    this.userName,
    this.userEmail,
    this.userPic
  });

  UserModel.fromJson(Map<dynamic , dynamic> map){
    if(map == null){
      return ;
    }

    userId = map['userId'];
    userName = map['userName'];
    userEmail = map['userEmail'];
    userPic = map['userPic'];
  }

  toJson(){
    return{
      'userId' : userId ,
      'userName' : userName ,
      'userEmail' : userEmail ,
      'userPic' : userPic
    };
  }
}