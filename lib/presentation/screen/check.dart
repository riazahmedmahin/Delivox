import 'package:flutter/material.dart';

class CheckRateScreen extends StatefulWidget {
  @override
  _CheckRateScreenState createState() => _CheckRateScreenState();
}

class _CheckRateScreenState extends State<CheckRateScreen> {
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Bar (Back & Notification)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),


                  ],
                ),

                SizedBox(height: 20),

                Text(
                  "Calculate for Shipment",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
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
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.white,
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
                    fillColor: Colors.white,
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
              width: double.infinity, // Makes the container take up all available space
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
                    onChanged: (newValue) {
                      setState(() {
                        selectedWeight = newValue!;
                      });
                    },
                    items: ["1 kg", "2 kg", "3 kg", "5 kg", "10 kg"]
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
        SizedBox(width: 15,),
            // Package Counter Container
            Expanded(
        flex: 2, // Adjusted flex to make it wider
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Package"),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity, // Makes the container take up all available space
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          if (packageCount > 1) {
                            setState(() {
                              packageCount--;
                            });
                          }
                        },
                      ),
                      Text("$packageCount", style: TextStyle(fontSize: 16)),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            packageCount++;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
            ),
          ],
        ),
        SizedBox(height: 15,),

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
                          padding: EdgeInsets.symmetric(vertical: 12),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: selectedDelivery == option
                                ? Colors.deepPurple
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
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

                SizedBox(height: 30),





                SizedBox(height: 30),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
