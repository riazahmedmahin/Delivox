import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/presentation/screen/CartDetails_screen.dart';

class PaymentMethodsScreen extends StatefulWidget {
  @override
  _PaymentMethodsScreenState createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  String? _selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payment Methods',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Cash', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            _buildPaymentOption('Cash', Icons.money, 'cash',assetImage: "https://cdn-icons-png.flaticon.com/128/2474/2474451.png"),
            SizedBox(height: 20),
            Text('More Payment Options', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            _buildPaymentOption('Mastercard', Icons.credit_card, 'mastercard', assetImage: 'https://cdn-icons-png.flaticon.com/128/14881/14881313.png'),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFFE0EBFB),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: Colors.indigo),
                    SizedBox(width: 8),
                    Text(
                      'Add New Card',
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {
                Get.to(()=>AddCardScreen());
              },
              child: Text(
                'Continue',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String title, IconData icon, String value, {String? assetImage}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPaymentMethod = value;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                assetImage != null
                    ? Image.network(assetImage, width: 24, height: 24)
                    : Icon(icon, color: Colors.black),
                SizedBox(width: 10),
                Text(title, style: TextStyle(fontSize: 16)),
              ],
            ),
            Radio(
              value: value,
              groupValue: _selectedPaymentMethod,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedPaymentMethod = newValue;
                });
              },
              activeColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}