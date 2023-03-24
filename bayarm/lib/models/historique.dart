import 'package:bayarm/models/transaction.dart';

enum Val { Orders, TopUp }

class Historiquetransaction {
  final String id;
  final Transaction transaction;
  final bool isSend;
  final Val valSend;

  Historiquetransaction(
      {required this.id,
      required this.transaction,
      required this.isSend,
      required this.valSend});
}

List<Historiquetransaction> historiques = [
  Historiquetransaction(
      id: "1", transaction: transactions[1], isSend: true, valSend: Val.Orders),
  Historiquetransaction(
      id: "2", transaction: transactions[2], isSend: false, valSend: Val.TopUp),
  Historiquetransaction(
      id: "3", transaction: transactions[3], isSend: true, valSend: Val.Orders),
  Historiquetransaction(
      id: "4", transaction: transactions[4], isSend: false, valSend: Val.TopUp),
  Historiquetransaction(
      id: "5", transaction: transactions[5], isSend: true, valSend: Val.Orders),
  Historiquetransaction(
      id: "6", transaction: transactions[6], isSend: false, valSend: Val.TopUp),
  Historiquetransaction(
      id: "7", transaction: transactions[7], isSend: true, valSend: Val.Orders),
  Historiquetransaction(
      id: "8", transaction: transactions[8], isSend: false, valSend: Val.TopUp),
  Historiquetransaction(
      id: "9", transaction: transactions[6], isSend: true, valSend: Val.Orders),
  Historiquetransaction(
      id: "10",
      transaction: transactions[7],
      isSend: false,
      valSend: Val.TopUp),
  Historiquetransaction(
      id: "11",
      transaction: transactions[1],
      isSend: true,
      valSend: Val.Orders),
  Historiquetransaction(
      id: "12", transaction: transactions[2], isSend: true, valSend: Val.TopUp),
  Historiquetransaction(
      id: "13",
      transaction: transactions[4],
      isSend: true,
      valSend: Val.Orders),
  Historiquetransaction(
      id: "14",
      transaction: transactions[6],
      isSend: false,
      valSend: Val.TopUp),
  Historiquetransaction(
      id: "15",
      transaction: transactions[4],
      isSend: true,
      valSend: Val.Orders),
];
