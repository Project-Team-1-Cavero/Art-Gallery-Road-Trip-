
import 'package:firebase_auth/firebase_auth.dart';

class firebaseAuthService
{
  
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> signIN() async {
    try{

      //User inloggen als Anonymously
      UserCredential result = await auth.signInAnonymously();
      User? user =  result.user;
      return user;

    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }

}