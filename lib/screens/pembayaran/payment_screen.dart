import 'package:agrolink/components/payment/payment_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Product', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20),),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: 1,
          itemBuilder: (context, index) {
            return const PaymentCard();
          }),
    );
  }
}