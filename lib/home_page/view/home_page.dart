import 'package:expense_tracker/login/view/login.dart';
import 'package:expense_tracker/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../auth/auth_service.dart';
import '../../new_expense_page/view/new_expense.dart';
import '../../utils/summary_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: AppColors.splashBackground,
          title: Text(
            "Spendo",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        drawer: _drawer(),
        floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NewExpense()),
            );
          },
          child: CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.splashBackground,
            child: Icon(Icons.add, color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            SummaryCard(duration: "Last 7 days"),
          ],
        ),
      ),
    );
  }

  Widget _drawer() {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.splashBackground),
            height: 100,
            width: double.infinity,
            child: Center(
              child: Text(
                "Settings",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text("Account"),
            leading: Icon(Icons.person),
            onTap: () {},
          ),
          ListTile(
            title: Text("Support"),
            onTap: () {},
            leading: Icon(Icons.support_agent),
          ),
          ListTile(
            title: Text("Privacy Policy"),
            onTap: () {},
            leading: Icon(Icons.privacy_tip),
          ),
          ListTile(
            title: Text("Terms & Conditions"),
            onTap: () {},
            leading: Icon(Icons.description),
          ),
          Divider(thickness: 5),
          ListTile(
            title: Text("Back to Home"),
            trailing: Icon(Icons.arrow_forward_rounded),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            title: Text("Logout"),
            trailing: Icon(Icons.logout),
            onTap: () async{
             final authService = AuthService();
             await authService.signOut();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) =>false,
              );
            },
          ),
        ],
      ),
    );
  }
}
