import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/presentation/screen/PaymentDetails_screen.dart';

class AddCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            GestureDetector(
              onTap: () => Get.back(),
              child: Icon(Icons.arrow_back, size: 28),
            ),
            SizedBox(height: 20),
            Container(
              height: 180,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15,),
                  Text(
                    "2569 **** **** 5432",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Card Holder Name", style: TextStyle(color: Colors.white70)),
                          Text("Esther Howard", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Expiry Date", style: TextStyle(color: Colors.white70)),
                          Text("02/06/30", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            CardDetailsField(icon: Icons.person, hint: "Card holder name"),
            CardDetailsField(icon: Icons.credit_card, hint: "Card number"),
            Row(
              children: [
                Expanded(
                  child: CardDetailsField(icon: Icons.calendar_today, hint: "Exp date"),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: CardDetailsField(icon: Icons.lock, hint: "CVC"),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Get.to(()=>BookingSummaryScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                "Add Card",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class CardDetailsField extends StatelessWidget {
  final IconData icon;
  final String hint;

  CardDetailsField({required this.icon, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey),
          hintText: hint,
          filled: true,
          fillColor: Color(0x0F4A75E8), // 0F is the hex for 6% opacity
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        //readOnly: true,
      ),
    );
  }
}
