import 'package:bayarm/models/product_model.dart';
import 'package:bayarm/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class Transaction {
  final ProductModel product;
  final UserModel user;
  final String montant;
  final Timestamp date;
  final String nom;

  Transaction(
      {required this.product,
      required this.user,
      required this.montant,
      required this.date,
      required this.nom});
}

List<Transaction> transactions = [
  Transaction(
      product: products2[2],
      user: user,
      montant: "2000",
      date: Timestamp.now(),
      nom: "Prayer Plant"),
  Transaction(
      product: products2[2],
      user: user,
      montant: "2000",
      date: Timestamp.now(),
      nom: "Top up Wallet"),
  Transaction(
      product: products2[2],
      user: user,
      montant: "2000",
      date: Timestamp.now(),
      nom: "Rubber Fig Plant"),
  Transaction(
      product: products2[2],
      user: user,
      montant: "2000",
      date: Timestamp.now(),
      nom: "Plant"),
  Transaction(
      product: products2[2],
      user: user,
      montant: "2000",
      date: Timestamp.now(),
      nom: "ZZ Plant"),
  Transaction(
      product: products2[2],
      user: user,
      montant: "2000",
      date: Timestamp.now(),
      nom: "Sansevieria Trifasciafa"),
  Transaction(
      product: products2[2],
      user: user,
      montant: "2000",
      date: Timestamp.now(),
      nom: "Chinese Money Plant"),
  Transaction(
      product: products2[2],
      user: user,
      montant: "2000",
      date: Timestamp.now(),
      nom: "Aspidistra Elatior"),
  Transaction(
      product: products2[2],
      user: user,
      montant: "2000",
      date: Timestamp.now(),
      nom: "Yucca Plant"),
];
