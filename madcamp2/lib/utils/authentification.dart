import '../server/network.dart';

class Authentication {
  static List<Map<String, String>> validCredentials = [];
  late String validUserEmail = '';
  late String validUserPassword = '';

  Future<bool> authenticate(String? email, String? password) async {
    // Simulate an asynchronous authentication process
    await Future.delayed(Duration(seconds: 1));

    await getUserData(); // Await the completion of getUserData

    // validCredentials.forEach((credential) {
    //   print(credential);
    // });

    // Check if the provided email and password match any valid credentials
    return validCredentials.any((credential) =>
        credential['email'] == email && credential['password'] == password);
  }

  Future<void> getUserData() async {
    Network network = Network('http://localhost:8000/get');

    var jsonData = await network.getJsonData();

    for (var i = 0; i < jsonData.length; i++) {
      validUserEmail = await jsonData[i]['email'];
      validUserPassword = await jsonData[i]['password'];

      Authentication.validCredentials
          .add({'email': validUserEmail, 'password': validUserPassword});
    }
  }
}
