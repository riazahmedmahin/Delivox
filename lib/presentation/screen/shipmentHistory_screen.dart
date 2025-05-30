import 'package:flutter/material.dart';

class ShipmentHistoryScreen extends StatefulWidget {
  @override
  _ShipmentHistoryScreenState createState() => _ShipmentHistoryScreenState();
}

class _ShipmentHistoryScreenState extends State<ShipmentHistoryScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Shipment History",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Tabs
          TabBar(
            controller: _tabController,
            labelColor: Colors.indigo,
            unselectedLabelColor: Colors.black54,
            indicatorColor: Colors.indigo,
            tabs: [
              Tab(text: "Pending"),
              Tab(text: "Completed"),
              Tab(text: "Cancelled"),
            ],
          ),

          // Tab Views
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Pending Tab
                _buildTabContent([
                  {
                    "image": "https://cdn-icons-png.flaticon.com/128/2420/2420464.png",
                    "title": "Sunset Lodge",
                    "Tracking Id": "#12345678",
                    "Pickup": "Banani",
                    "checkOut": "Dhanmondi",
                    "price": "\$1,200",
                  },
                  {
                    "image": "https://cdn-icons-png.flaticon.com/128/2420/2420464.png",
                    "title": "Golden Gate",
                    "Tracking Id": "#87654321",
                    "Pickup": "Mirpur",
                    "checkOut": "Uttara",
                    "price": "\$1,400",
                  },
                ]),

                // Completed Tab
                _buildTabContent([
                  {
                    "image": "https://cdn-icons-png.flaticon.com/128/2420/2420464.png",
                    "title": "Venture Vista",
                    "Tracking Id": "#26578578",
                    "Pickup": "Nasiabad",
                    "checkOut": "Gulshan",
                    "price": "\$1,600",
                  },
                  {
                    "image": "https://cdn-icons-png.flaticon.com/128/2420/2420464.png",
                    "title": "Peakview Inn",
                    "Tracking Id": "#5641089",
                    "Pickup": "Chittagong",
                    "checkOut": "Dhaka",
                    "price": "\$1,700",
                  },
                ]),

                // Cancelled Tab
                _buildTabContent([
                  {
                    "image": "https://cdn-icons-png.flaticon.com/128/2420/2420464.png",
                    "title": "Skyline Suites",
                    "Tracking Id": "#98765432",
                    "Pickup": "Bashundhara",
                    "checkOut": "Mohakhali",
                    "price": "\$1,500",
                  },
                  {
                    "image": "https://cdn-icons-png.flaticon.com/128/2420/2420464.png",
                    "title": "Ocean View",
                    "Tracking Id": "#13572468",
                    "Pickup": "Cox's Bazar",
                    "checkOut": "Chittagong",
                    "price": "\$1,800",
                  },
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent(List<Map<String, String>> bookings) {
    if (bookings.isEmpty) {
      return Center(
        child: Text("No bookings found", style: TextStyle(fontSize: 16, color: Colors.black54)),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 1),
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        return _buildBookingCard(
          image: bookings[index]["image"]!,
          title: bookings[index]["title"]!,
          location: bookings[index]["Tracking Id"]!,
          checkIn: bookings[index]["Pickup"]!,
          checkOut: bookings[index]["checkOut"]!,
          price: bookings[index]["price"]!,
        );
      },
    );
  }

  Widget _buildBookingCard({
    required String image,
    required String title,
    required String location,
    required String checkIn,
    required String checkOut,
    required String price,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(image, width: 60, height: 60, fit: BoxFit.cover),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text(location, style: TextStyle(fontSize: 14, color: Colors.black54)),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Pickup", style: TextStyle(fontSize: 12, color: Colors.black54)),
                  Text(checkIn, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Drop off", style: TextStyle(fontSize: 12, color: Colors.black54)),
                  Text(checkOut, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ],
              ),
              Text(
                price,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildButton("27 Sep 2015", Colors.blue[100]!, Colors.blue),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, Color bgColor, Color textColor) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Text(text, style: TextStyle(color: textColor)),
      ),
    );
  }
}
