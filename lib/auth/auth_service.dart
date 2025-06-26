import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final _supabase = Supabase.instance.client;

  Future<String> signUp(String email, String password) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );

      final user = _supabase.auth.currentUser;
      if (user != null) {
        await _supabase.from('users').insert({
          'id': user.id,
          'email': user.email,
        });

        return "Sign-up successful! Please check your email to verify your account.";
      } else {
        return "Unexpected error occurred";
      }
    } on AuthException catch (error) {
      return "Error: ${error.message}";
    } catch (e) {
      return "An unknown error occurred";
    }
  }

  Future<String> signInWithPassword(String email, String password) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        return "Login successful.";
      } else {
        return "Unexpected error occurred";
      }
    } on AuthException catch (error) {
      return "Error: ${error.message}";
    } catch (e) {
      return "An unknown error occurred";
    }
  }

  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  String? getCurrentUserEmail() {
    final session = _supabase.auth.currentSession;
    final user = session?.user;
    return user?.email;
  }
}
