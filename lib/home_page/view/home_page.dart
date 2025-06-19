import 'package:expense_tracker/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../new_expense_page/view/new_expense.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Container(
            height: 100,
            width: 100,
            child: Card(
              color: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(children: [Icon(Icons.pie_chart)]),
            ),
          ),
        ],
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
        ],
      ),
    );
  }
}
