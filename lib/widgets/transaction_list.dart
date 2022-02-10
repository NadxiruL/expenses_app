import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function? deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      //gunakan dynamic high
      //allow device styles behave diffrent on different device or different screen.
      //0.6 is 60%
      height: MediaQuery.of(context).size.height * 0.6,
      //jika transaction tiada keluarkan text no transaction added.
      child: transactions.isEmpty
          ? Column(
              children: [
                const Text(
                  'No transactions added yet!',
                  style: TextStyle(fontSize: 20),
                ),
                Image.network(
                  'https://occ-0-2794-2219.1.nflxso.net/dnm/api/v6/LmEnxtiAuzezXBjYXPuDgfZ4zZQ/AAAABcFD9As-D5s_BwnYqoSR38yvjMdwgTF1yElOJve7yWYtQ8mrthsip916uqtA3n-UEEmWtH9ADQhxQu8xGz75XxhynbmSN97KfWKb.png?r=241',
                  width: 200,
                  height: 200,
                ),
              ],
            )
          : ListView.builder(
              //item builder is function , itembuilder disini return card yang menganduingi senarai list of expenses.
              itemBuilder: (context, index) => Card(
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text('\$${transactions[index].amount}'),
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].datetime),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      deleteTx!(transactions[index].id);
                    },
                  ),

                  // Card(
                  //   child: Row(
                  //     children: [
                  //       Container(
                  //         margin: const EdgeInsets.symmetric(
                  //             vertical: 10, horizontal: 15),
                  //         decoration: BoxDecoration(
                  //           border: Border.all(
                  //             color: Colors.black,
                  //             width: 2,
                  //           ),
                  //         ),
                  //         padding: EdgeInsets.all(10),
                  //         child: Text(
                  //           //for concatination with others sign.
                  //           '\$${transactions[index].amount.toStringAsFixed(2)}',
                  //           //or use tx.amount.toString(),
                  //         ),
                  //       ),
                  //       Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             transactions[index].title,
                  //             style: TextStyle(fontWeight: FontWeight.bold),
                  //           ),
                  //           Text(
                  //             DateFormat().format(transactions[index].datetime),
                  //             style: TextStyle(fontWeight: FontWeight.bold),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  //use map to transform list of object to list of widget.
                  // children: transactions
                  //     .map(
                  //       //title are displayed in card.
                  //       (tx) =>
                  //     )
                  //     .toList(),
                ),
              ),
              itemCount: transactions.length,
            ),
    );
  }
}
