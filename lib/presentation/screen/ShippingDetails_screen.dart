import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/presentation/screen/CartDetails_screen.dart';
import 'package:user_app/presentation/screen/Payment.dart';
import 'package:user_app/presentation/widgets/filter.dart';

class ShippingDetailsScreen extends StatefulWidget {
  @override
  _ShippingDetailsScreenState createState() => _ShippingDetailsScreenState();
}

class _ShippingDetailsScreenState extends State<ShippingDetailsScreen> {
  // Controllers for text fields
  TextEditingController pickupController = TextEditingController();
  TextEditingController dropOffController = TextEditingController();

  // Weight & package count
  String selectedWeight = "1 kg";
  int packageCount = 1;

  // Delivery options
  String selectedDelivery = "Regular"; // Default selected
  Map<String, Map<String, dynamic>> deliveryOptions = {
    "Regular": {
      "price": 10,
      "days": 5,
    },
    "Standard": {
      "price": 25,
      "days": 3,
    },
    "Express": {
      "price": 50,
      "days": 1,
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Text(
                  "Set preferences for your shipments.",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),

                SizedBox(height: 20),

                // Destination Fields
                Text("Select destination",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),

                // Pickup Destination
                TextField(
                  controller: pickupController,
                  decoration: InputDecoration(
                    hintText: "Enter your Pick-up destination",
                    prefixIcon: Icon(Icons.location_on_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Color(0x0F4A75E8), // Light gray background
                  ),
                ),


                SizedBox(height: 10),

                // Drop-off Destination
                TextField(
                  controller: dropOffController,
                  decoration: InputDecoration(
                    hintText: "Enter your drop-off destination",
                    prefixIcon: Icon(Icons.flag_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Color(0x0F4A75E8),
                  ),
                ),

                SizedBox(height: 20),
                // New Section: Shipping Details (Separate Containers for Weight Picker and Package Counter)
                Text("Shipping Details",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),

                // Shipping Details Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Weight Picker Container
                    Expanded(
                      flex: 2, // Adjusted flex to make it wider
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Weights"),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: double
                                .infinity, // Makes the container take up all available space
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                DropdownButton<String>(
                                  value: selectedWeight,
                                  underline:
                                      SizedBox(), // Removes the underline
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedWeight = newValue!;
                                    });
                                  },
                                  items: [
                                    "1 kg",
                                    "2 kg",
                                    "3 kg",
                                    "5 kg",
                                    "10 kg"
                                  ]
                                      .map((weight) => DropdownMenuItem<String>(
                                            value: weight,
                                            child: Text(weight),
                                          ))
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    
                    // Package Counter Container
                    Expanded(
                      flex: 2, // Makes it take more space
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Package"),
                          SizedBox(height: 10),
                          Container(
                            height: 50,
                            width: double.infinity, // Takes full width
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceEvenly, // Center alignment
                              children: [
                                // Decrease Button
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.indigo,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.remove,
                                        size: 16, color: Colors.white),
                                    onPressed: () {
                                      if (packageCount > 1) {
                                        setState(() {
                                          packageCount--;
                                        });
                                      }
                                    },
                                    padding:
                                        EdgeInsets.zero, // Remove extra padding
                                    constraints:
                                        BoxConstraints(), // Remove extra constraints
                                  ),
                                ),

                                // Package Count Display
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    "$packageCount",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),

                                // Increase Button
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.indigo,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.add,
                                        size: 16, color: Colors.white),
                                    onPressed: () {
                                      setState(() {
                                        packageCount++;
                                      });
                                    },
                                    padding: EdgeInsets.zero,
                                    constraints: BoxConstraints(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
CategoriesFilter(),
SizedBox(height: 20,),
                // Delivery Options
                Text("Shipment Details",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: ["Regular", "Standard", "Express"].map((option) {
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDelivery = option;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: selectedDelivery == option
                                ? Colors.deepPurple
                                : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: selectedDelivery == option
                                  ? Colors.deepPurple
                                  : Colors.grey,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            option,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: selectedDelivery == option
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),

                SizedBox(height: 20),

                // Shipment Info Box
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.local_shipping,
                                  color: Colors.deepPurple),
                              SizedBox(width: 5),
                              Text(
                                "${deliveryOptions[selectedDelivery]!['days']} Days",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "\$${deliveryOptions[selectedDelivery]!['price']}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Your shipment will be delivered in the selected time frame.",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                

                SizedBox(height: 50),

                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){
                    Get.to(()=>PaymentMethodsScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo
                  ),
                   child: Text("Next",style: TextStyle(color: Colors.white),)),
                ),

                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
