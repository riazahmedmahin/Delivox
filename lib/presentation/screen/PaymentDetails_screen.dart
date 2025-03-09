import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:user_app/presentation/screen/Payment.dart';

class BookingSummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,title: Text("Deatils"),centerTitle: true,),
      backgroundColor:Colors.white, // Light background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            
            //mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //SizedBox(height: 5,),
              _buildSectionTitle('Booking Details'),
              _buildDetailRow('Parcel Date', '04/03/25 | 11:20 AM', isBold: false),
              _buildDetailRow('Package Qunatity', '1', isBold: false),
              _buildDetailRow('weight', '5Kg', isBold: false),
              _buildDetailRow('Type', 'Electronic', isBold: false),
              _buildDetailRow('Delivery Type', 'Regular', isBold: false),
              _buildDetailRow('Pickup destinaton', 'Nasirabad', isBold: false),
              _buildDetailRow('Dropoff destinaton', 'Gulshan 10/04', isBold: false),


              SizedBox(height: 15),
              
              // _buildSectionTitle('Guest Details'),
              // _buildDetailRow('Guest Name', 'Alvi Ahmed', isBold: true),
              // _buildDetailRow('Guest', '01', isBold: true),
              // _buildDetailRow('Room', '01', isBold: true),
              // SizedBox(height: 15),
              Divider(thickness: 1,),
              SizedBox(height: 10,),
              _buildSectionTitle('Payment Details'),
              _buildDetailRow('Amount', '\$1,500', isBold: false),
              _buildDetailRow('Total', '\$1,503.15', isBold: false),
              
              _buildPaymentMethod(),
              Spacer(),
              
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo, // Blue button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {
                    //Get.to(()=>PaymentMethodsScreen());
                  },
                  child: Text(
                    'Pay \$259.15',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: isBold ? Colors.black : Colors.grey,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethod() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Payment Methods',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Color(0xFFEDF1FF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            'Cash',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF4A75E8)),
          ),
        ),
      ],
    );
  }
}
