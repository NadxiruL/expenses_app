import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  //declare untuk menerima input
  final titleController = TextEditingController();

  //declare untuk menerima input.
  final amountController = TextEditingController();

  DateTime? _selectedDate;

  void submitData() {
    if (amountController.text.isEmpty) {
      return;
    }

    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      //addTx will not executed , return will stop function execution.
      return;
    }

    widget.addTx(
      titleController.text,
      double.parse(amountController.text),
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  // const NewTransaction({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              //controller akan menerima input
              controller: titleController,
              onSubmitted: (_) => submitData(),
              decoration: const InputDecoration(
                labelText: 'title',
              ),
            ),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(labelText: 'amount'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),
            ),
            Row(
              children: [
                Text(
                  _selectedDate == null
                      ? 'No date selected'
                      : 'Selected date'
                          ' ${DateFormat.yMd().format(_selectedDate!)}',
                ),
                const Padding(
                  padding: EdgeInsets.all(5),
                ),
                ElevatedButton(
                  onPressed: _presentDatePicker,
                  child: const Text('Select Date'),
                ),
              ],
            ),
            TextButton(
              onPressed: submitData,
              child: const Text(
                'Add',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
