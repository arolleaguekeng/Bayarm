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

List<Historiquetransaction> historiques =[];
