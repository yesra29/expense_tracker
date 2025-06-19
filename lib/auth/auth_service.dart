import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final  _supabase = Supabase.instance.client;

  Future<String> signUp(String email, String password) async {
    try{
    final response=  await _supabase.auth.signUp(email: email, password: password);
    if (response.user != null) {
      return "Sign-up successful! Please check your email to verify your account.";
    }else {
      return "Unexpected error occured";
    }
    } on AuthException catch(error) {
      return "Error:${error.message}";
    }catch(e) {
      return "An unknown error occured";
    }
    }

  Future<String> signInWithPassword(String email, String password) async {
    try{
      final response=  await _supabase.auth.signInWithPassword(email: email, password: password);
      if (response.user != null) {
        return "Login successsful.";
      }else {
        return "Unexpected error occured";
      }
    } on AuthException catch(error) {
      return "Error:${error.message}";
    }catch(e) {
      return "An unknown error occured";
    }
  }
  }

//   Future<void> signOut() async {
//     await _supabase.auth.signOut();
//   }
//
//   String? getCurrentUserEmail() {
//     final session =_supabase.auth.currentSession;
//     final user = session?.user;
//     return user?.email;
//   }
// }
