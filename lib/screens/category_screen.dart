import 'package:budget_app/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:budget_app/models/category_model.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({required this.category, super.key});

  final Category category;
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    double totalAmountSpend = 0;
    widget.category.expenses.forEach((Expense expense) {
      totalAmountSpend += expense.cost;
    });
    final double amountLeft = widget.category.maxAmount - totalAmountSpend;
    final double percent = amountLeft / widget.category.maxAmount;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(widget.category.name),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
            iconSize: 30.0,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(20.0),
              height: 250.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 2),
                      blurRadius: 6.0),
                ],
              ),
              child: Center(
                child: Text(
                    '\$${amountLeft.toStringAsFixed(2)} / \$${widget.category.maxAmount}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
