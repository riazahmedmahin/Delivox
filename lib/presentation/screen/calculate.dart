import 'package:flutter/material.dart';

class CheckRatesScreen extends StatefulWidget {
  @override
  _CheckRatesScreenState createState() => _CheckRatesScreenState();
}

class _CheckRatesScreenState extends State<CheckRatesScreen> {
  TextEditingController weightController = TextEditingController(text: "");
  TextEditingController pickupController = TextEditingController();
  TextEditingController dropOffController = TextEditingController();
  int packageQuantity = 1;

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
            Text("Check Rates", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            _textField(Icons.inventory_2_outlined, "Pickup Location", pickupController),
            SizedBox(height: 10),
            _textField(Icons.location_on_outlined, "Package Destination", dropOffController),
            SizedBox(height: 20),
            Text("Weight"),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(prefixIcon: Icon(Icons.scale_sharp,size: 17,), suffixText: "Kg"),
            ),
            SizedBox(height: 20),
            Text("Package Quantity"),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                color: Color(0x0F4A75E8),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        packageQuantity = (packageQuantity > 1) ? packageQuantity - 1 : 1;
                      });
                    },
                    icon: Icon(Icons.remove_circle,color: Colors.indigo,),
                  ),
                  Text("$packageQuantity Package"),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        packageQuantity++;
                      });
                    },
                    icon: Icon(Icons.add_circle,color: Colors.indigo,),
                  ),
                ],
              ),
            ),
            Spacer(),
ElevatedButton(
  onPressed: () {
    if (pickupController.text.isEmpty || dropOffController.text.isEmpty || weightController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in all fields")),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShipmentDetailsScreen(
          pickupLocation: pickupController.text,
          dropOffLocation: dropOffController.text,
          weight: double.tryParse(weightController.text) ?? 0.0,
          packageQuantity: packageQuantity,
        ),
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.indigo,
    minimumSize: Size(double.infinity, 50),
  ),
  child: Text(
    "Check Rates",
    style: TextStyle(color: Colors.white),
  ),
),

          ],
        ),
      ),
    );
  }

  Widget _textField(IconData icon, String hint, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        border: OutlineInputBorder(),
      ),
    );
  }
}

class ShipmentDetailsScreen extends StatefulWidget {
  final String pickupLocation;
  final String dropOffLocation;
  final double weight;
  final int packageQuantity;

  ShipmentDetailsScreen({
    required this.pickupLocation,
    required this.dropOffLocation,
    required this.weight,
    required this.packageQuantity,
  });

  @override
  _ShipmentDetailsScreenState createState() => _ShipmentDetailsScreenState();
}

class _ShipmentDetailsScreenState extends State<ShipmentDetailsScreen> {
  String _selectedDelivery = "Regular delivery";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,title: Text("Shipment Details"),centerTitle: true,),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [  
            Text("Check Rates", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            _infoTile(Icons.inventory_2_outlined, widget.pickupLocation),
            _infoTile(Icons.location_on_outlined, widget.dropOffLocation),
            SizedBox(height: 20),
            Text("Shipment Details", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _infoColumn("Parcel", "Shipping Type"),
                _infoColumn("${widget.packageQuantity}", "Quantity"),
                _infoColumn("${widget.weight.toStringAsFixed(2)} Kg", "Weight"),
              ],
            ),
            SizedBox(height: 20),
            Text("Delivery Type", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10,),
            _deliveryOption("Regular delivery", "\$10 USD", "3 Days"),
            _deliveryOption("Standard delivery", "\$25 USD", "5 Days"),
            _deliveryOption("Express delivery", "\$45 USD", "1 Day"),
          ],
        ),
      ),
    );
  }

  Widget _infoTile(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0x0F4A75E8),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(text),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoColumn(String title, String subtitle) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Text(subtitle, style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _deliveryOption(String type, String price, String duration) {
    bool isSelected = _selectedDelivery == type;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedDelivery = type;
        });
      },
      child: Card(
        color: isSelected ? Colors.indigo : Colors.white,
        child: ListTile(
          leading: Icon(Icons.local_shipping, color: isSelected ? Colors.white : Colors.black),
          title: Text(type, style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
          subtitle: Text(price, style: TextStyle(color: isSelected ? Colors.white70 : Colors.black54)),
          trailing: Text(duration, style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
        ),
      ),
    );
  }
}
