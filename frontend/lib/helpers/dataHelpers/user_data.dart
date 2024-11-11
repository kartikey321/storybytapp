import 'package:storybytapp/helpers/dioHelper/dio_helper.dart';
import 'package:storybytapp/models/user.dart';

class UserData {
  static addData(UserModel user) async {
    DioClient dioClient = DioClient();
    var mappedUser = user.toMap();
    await dioClient.post('http://10.0.2.2:3000/api/user/create-user',
        headers: {'Content-Type': 'application/json'}, body: mappedUser);
  }
}
