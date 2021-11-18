import 'package:untitled_test/model_user.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String signUpApi = "https://api.dev.trapme.io/test-api/public/api/signup";
  String loginApi="https://api.dev.trapme.io/test-api/public/api/login";
  String addUserApi="https://api.dev.trapme.io/test-api/public/api/user/add";

  Future<int> reg(User user) async {
    var uri = Uri.parse(signUpApi);
    var request = http.MultipartRequest('POST', uri);
    //request.headers.addAll(headers);
    request.fields["name"] = user.name;
    request.fields["email"] = user.email;
    request.fields["latitude"] = user.latitude;
    request.fields["longitude"] = user.longitude;
    request.fields["password"] = user.password;
    request.fields["gender"] = user.gender.toString();
    request.fields["phone"] = user.phone;

    if (user.image != null) {
      print("not null");
      String path = user.image.path.substring(37);
      request.files
          .add(await http.MultipartFile.fromPath('img', user.image.path));
    }

    var res = await request.send();

    print(res.statusCode);
    if (res.statusCode == 200) {
      print("statuscode  = 200");
      final body = await res.stream.bytesToString();
    } else {
      print("not working");
    }
    return res.statusCode;
  }
  add(User user) async {
    var uri = Uri.parse(addUserApi);
    var request = http.MultipartRequest('POST', uri);
    //request.headers.addAll(headers);
    request.fields["name"] = user.name;
    request.fields["email"] = user.email;
    request.fields["latitude"] = user.latitude;
    request.fields["longitude"] = user.longitude;
    request.fields["password"] = user.password;
    request.fields["gender"] = user.gender as String;
    request.fields["phone"] = user.phone;

    if (user.image != null) {
      print("not null");
      String path = user.image.path.substring(37);
      request.files
          .add(await http.MultipartFile.fromPath('img', user.image.path));
    }

    var res = await request.send();

    print(res.statusCode);
    if (res.statusCode == 200) {
      print("statuscode  = 200");
      final body = await res.stream.bytesToString();
    } else {}
  }
  login(String email,String password) async {
    var uri = Uri.parse(loginApi);
    var response= await http.post(uri);
    if(response.statusCode==200){

    }else{

    }
  }
  delete(){}
}
