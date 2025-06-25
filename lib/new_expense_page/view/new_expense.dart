import 'package:expense_tracker/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../../utils/expense_input_field.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  DateTime? selectedDate;
  final amountController = TextEditingController();
  final merchantController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: const Icon(Icons.arrow_back, color: Colors.white),
          backgroundColor: AppColors.splashBackground,
          title: const Text(
            "Add Transaction",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExpenseInputField(
                hintText: "Amount",
                keyboardType: TextInputType.number,
                controller: amountController,
              ),
              const SizedBox(height: 20),
              ExpenseInputField(
                hintText: "Merchant (e.g. Uber)",
                keyboardType: TextInputType.text,
                controller: merchantController,
              ),
              const SizedBox(height: 30),
              Text(
                "Category",
                style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _categoryBox("Food", Icons.fastfood_outlined),
                      const SizedBox(width: 5),
                      _categoryBox("Transport", Icons.directions_bus),
                      const SizedBox(width: 5),
                      _categoryBox("Grocery", Icons.local_grocery_store),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [_categoryBox("Others", Icons.devices_other)],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                "Date",
                style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 15),
              _dateButton(),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _button(
                    bgColor: Colors.grey,
                    fontColor: Colors.black,
                    text: "Cancel",
                    onTap: () {},
                  ),
                  const SizedBox(width: 30),
                  _button(
                    bgColor: AppColors.splashBackground,
                    fontColor: Colors.white,
                    text: "Save",
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Widget _dateButton() {
    return InkWell(
      onTap: () => _pickDate(context),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDate != null
                  ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                  : "Select date",
              style: const TextStyle(fontSize: 16),
            ),
            const Icon(Icons.calendar_today),
          ],
        ),
      ),
    );
  }

  Widget _categoryBox(String category, IconData icon) {
    return GestureDetector(
      child: Container(
        height: 50,
        width: 120,
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(icon), const SizedBox(width: 5), Text(category)],
        ),
      ),
    );
  }

  Widget _button({
    required Color bgColor,
    required String text,
    required Color fontColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(text, style: TextStyle(color: fontColor, fontSize: 18)),
        ),
      ),
    );
  }
}
