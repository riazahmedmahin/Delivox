import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:user_app/presentation/Data/StateHolder/categoryController.dart';
import 'package:user_app/presentation/Data/model/categoeyData.dart';
import 'package:user_app/presentation/utility/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Get.find<CategoryListController>().getCategoryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
         appBar: PreferredSize(
        preferredSize: Size.fromHeight(175), // Total height of AppBar
        child: appbar(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 18,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //const HomeHeader(),
            const DiscountBanner(),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text("Category",style: TextStyle(fontSize: 15,color: Colors.black87,fontWeight: FontWeight.bold),),
            ),
            GetBuilder<CategoryListController>(
              builder: (categoryListController) {
                return Visibility(
                  visible:
                      !categoryListController.inProgress, // Only show when not loading
                  replacement: const Center(
                      child:
                          CircularProgressIndicator()), // Show loader when fetching data
                  child: Categories(),
                );
              },
            ),
            ShipmentTrackingCard(),
            const SpecialOffers(),
            SizedBox(height: 10,),
            
            //service(),
            const SizedBox(height: 20),
            //const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}



class service extends StatelessWidget {
  const service({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          serviceItem(),
          serviceItem()
        ],
      ),
    );
  }
}

class serviceItem extends StatelessWidget {
  const serviceItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
        children: [
          Container(
            height: 150,
            width: 180,
          decoration: BoxDecoration(
            color: AppColors.colorSwatch[900],
           borderRadius: BorderRadius.circular(8)
          ),
          //margin: EdgeInsets.only(top: 10),
          child: Padding(
            padding: const EdgeInsets.only(top: 95),
            child: Column(
              children: [
                Text("Check Rate",style: TextStyle(color: Colors.white),),
                Icon(Icons.arrow_circle_right_outlined,size: 25,)
              ],
            ),
          )
        ),
        Positioned(
          top: 8,
          child: Image.network("https://cdn-icons-png.flaticon.com/128/2420/2420464.png",
          height: 80,
          width: 80,
          ),
        )
        
        ]
      );
  }
}

class appbar extends StatelessWidget {
  const appbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
       automaticallyImplyLeading: false,
      toolbarHeight: 150,
      backgroundColor: const Color(0xFF4A3298),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(18), // Rounded bottom
        ),
      ),
      title: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text("Wellcome,",style: TextStyle(color: Colors.white,fontSize: 18),),
          SizedBox(height: 5,),
          Text("Hello, Riaz",style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.w700),),
          SizedBox(height: 12,),
          HomeHeader(), // Space between icons and search
          
     
        ],
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Track your Product",style: TextStyle(color: Colors.white60,fontSize: 13),),
              SizedBox(height: 5,),
              SearchField(),
            ],
          )),
          const SizedBox(width: 16,),
          // Column(
          //   children: [
          //     SizedBox(height: 15,),
          //     IconBtnWithCounter(
          //       // numOfitem: 3,
          //       svgSrc: cartIcon,
          //       press: () {},
          //     ),
          //   ],
          // ),
          const SizedBox(width: 8),
          Column(
            children: [
              SizedBox(height: 15,),
              IconBtnWithCounter(
                svgSrc: bellIcon,
                numOfitem: 3,
                press: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
  onChanged: (value) {},
  decoration: InputDecoration(
    filled: true,
    fillColor: Colors.white, // Set background color to white
    hintStyle: const TextStyle(color: Color(0xFF757575)),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide.none,
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide.none,
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide.none,
    ),
    hintText: "Tracking ID",
    
    prefixIcon:  Icon(Icons.search, color: Colors.grey.shade400),
  ),
),

    );
  }
}

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    Key? key,
    required this.svgSrc,
    this.numOfitem = 0,
    required this.press,
  }) : super(key: key);

  final String svgSrc;
  final int numOfitem;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
  
          Container(
          
            padding: const EdgeInsets.all(12),
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              color:  Colors.white,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.string(svgSrc),
          ),
          if (numOfitem != 0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "$numOfitem",
                    style: const TextStyle(
                      fontSize: 12,
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 9,right: 9),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text.rich(
        TextSpan(
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(text: "A Summer Surpise\n"),
            TextSpan(
              text: "Cashback 20%",
              style: TextStyle(
                fontSize: 24,
                //color: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": flashIcon, "text": "Electronic"},
      {"icon": billIcon, "text": "Bill"},
      {"icon": billIcon, "text": "Document"},
      {"icon": giftIcon, "text": "Gift"},
      {"icon": discoverIcon, "text": "More"},
    ];
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {},
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFFFECDF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.string(icon),
          ),
          const SizedBox(height: 4),
          Text(text, textAlign: TextAlign.center)
        ],
      ),
    );
  }
}

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: SectionTitle(
            title: "Special for you",
            press: () {},
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                image: "https://i.postimg.cc/yY2bNrmd/Image-Banner-2.png",
                category: "Smartphone",
                numOfBrands: 18,
                press: () {},
              ),
              SpecialOfferCard(
                image: "https://i.postimg.cc/BQjz4G1k/Image-Banner-3.png",
                category: "Fashion",
                numOfBrands: 24,
                press: () {},
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: 242,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black54,
                        Colors.black38,
                        Colors.black26,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfBrands Brands")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        TextButton(
          onPressed: press,
          style: TextButton.styleFrom(foregroundColor: Colors.grey),
          child: const Text("See more"),
        ),
      ],
    );
  }
}




class ShipmentTrackingCard extends StatelessWidget {
  const ShipmentTrackingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _Text(),
              _buildShipmentDetails(),
              const Divider(),
              const SizedBox(height: 8),
              _buildLocationDetails(),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 8),
              _buildStatus(),
            ],
          ),
        ),
      ),
    );
  }

  Row _Text() {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Current shipment",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                //Text("See all")
              ],
            );
  }

  // Header Section


  // Shipment Details
  Widget _buildShipmentDetails() {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.orange.shade100,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.local_shipping, color: Colors.orange),
      ),
      title: const Text(
        "Macbook pro M2",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      subtitle: const Text(
        "#Tracking ID: H123135461235",
        style: TextStyle(color: Colors.grey),
      ),
     // trailing: const Icon(Icons.more_vert),
    );
  }

  // Location Details
  Widget _buildLocationDetails() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            const Icon(Icons.circle, size: 12, color: Colors.blue),
            Container(
              height: 30,
              width: 2,
              color: Colors.blue,
            ),
            const Icon(Icons.circle, size: 12, color: Colors.grey),
            Container(
              height: 30,
              width: 2,
              color: Colors.blue,
            ),
            const Icon(Icons.circle, size: 12, color: Colors.grey),
          ],
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("From:", style: TextStyle(color: Colors.grey)),
            const Text(
              "3/04 Mirpur 10, Dhaka",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text("Shipping To:", style: TextStyle(color: Colors.grey)),
            const Text(
              "3/04 Gulshan 11, Dhaka",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  // Status Section
  Widget _buildStatus() {
    return Row(
      children: [
        const Text(
          "• Status: ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          "Your package is in transit",
          style: TextStyle(color: Colors.grey.shade700),
        ),
      ],
    );
  }
}

const heartIcon =
    '''<svg width="18" height="16" viewBox="0 0 18 16" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M16.5266 8.61383L9.27142 15.8877C9.12207 16.0374 8.87889 16.0374 8.72858 15.8877L1.47343 8.61383C0.523696 7.66069 0 6.39366 0 5.04505C0 3.69644 0.523696 2.42942 1.47343 1.47627C2.45572 0.492411 3.74438 0 5.03399 0C6.3236 0 7.61225 0.492411 8.59454 1.47627C8.81857 1.70088 9.18143 1.70088 9.40641 1.47627C11.3691 -0.491451 14.5629 -0.491451 16.5266 1.47627C17.4763 2.42846 18 3.69548 18 5.04505C18 6.39366 17.4763 7.66165 16.5266 8.61383Z" fill="#DBDEE4"/>
</svg>
''';

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";

const billIcon =
    '''<svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M16.2149 12.2832C16.2149 12.6547 15.9099 12.9547 15.5347 12.9547H6.46532C6.08894 12.9547 5.78625 12.6547 5.78625 12.2832C5.78625 11.9116 6.08894 11.6116 6.46532 11.6116H15.5347C15.9099 11.6116 16.2149 11.9116 16.2149 12.2832ZM16.2149 7.24678C16.2149 7.61835 15.9099 7.9183 15.5347 7.9183H6.46532C6.08894 7.9183 5.78625 7.61835 5.78625 7.24678C5.78625 6.87521 6.08894 6.57527 6.46532 6.57527H15.5347C15.9099 6.57527 16.2149 6.87521 16.2149 7.24678ZM20.6396 17.7806L17.8757 20.3973L14.901 17.5825C14.6368 17.3341 14.2219 17.333 13.9589 17.5837L10.9921 20.3973L8.02412 17.5837C7.7611 17.333 7.34505 17.333 7.0809 17.5837L4.11409 20.3973L1.3604 17.7818V4.0291C1.3604 2.54841 2.5825 1.34303 4.08121 1.34303H17.9188C19.4186 1.34303 20.6396 2.54841 20.6396 4.0291V17.7806ZM17.9188 0H4.08121C1.83088 0 0 1.8075 0 4.0291V17.9978C0 18.0112 0.00680202 18.0235 0.00793569 18.0369C-0.00113367 18.2238 0.0623519 18.4119 0.208595 18.5518L3.64248 21.812C3.90663 22.0616 4.32268 22.0627 4.5857 21.812L7.55251 18.9983L10.5205 21.812C10.7835 22.0627 11.1984 22.0627 11.4625 21.812L14.4305 18.9983L17.4052 21.8131C17.5367 21.9373 17.7057 22 17.8757 22C18.0446 22 18.2147 21.9373 18.3462 21.8131L21.7903 18.5529C21.9376 18.413 22.0011 18.2238 21.9921 18.0369C21.9932 18.0224 22 18.0112 22 17.9978V4.0291C22 1.8075 20.1691 0 17.9188 0Z" fill="#FF7643"/>
</svg>
''';

const flashIcon =
    '''<svg width="19" height="22" viewBox="0 0 19 22" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M8.77515 20.8036V13.4372C8.77515 12.8219 8.26702 12.3207 7.64317 12.3207L1.25313 12.4037L10.2248 1.19586V8.56224C10.2248 9.17757 10.733 9.67877 11.3568 9.67877L17.7469 9.59575L8.77515 20.8036ZM18.8789 9.11013C18.6758 8.69299 18.2571 8.43357 17.7879 8.43357H11.4873V1.19586C11.4873 0.681174 11.1696 0.239128 10.6772 0.0689514C10.1859 -0.101226 9.65675 0.0502734 9.33062 0.449774L0.266324 11.6265C-0.0271929 11.9876 -0.0818985 12.4722 0.121144 12.8893C0.324186 13.3064 0.742894 13.5659 1.2121 13.5659H7.51271V20.8036C7.51271 21.3183 7.83043 21.7603 8.32278 21.9305C8.45744 21.9772 8.59525 22 8.73097 22C9.08866 22 9.43267 21.8412 9.66938 21.5497L18.7337 10.374C19.0272 10.0119 19.0819 9.52831 18.8789 9.11013Z" fill="#FF7643"/>
</svg>
''';

const packageIcon =
    '''<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="https://cdn-icons-png.flaticon.com/128/679/679922.png">
<path fill-rule="evenodd" clip-rule="evenodd" d="M12 2C12.5523 2 13 2.44772 13 3V5H11V3C11 2.44772 11.4477 2 12 2ZM9 5V3C9 1.34315 10.3431 0 12 0C13.6569 0 15 1.34315 15 3V5H19C20.1046 5 21 5.89543 21 7V19C21 20.1046 20.1046 21 19 21H5C3.89543 21 3 20.1046 3 19V7C3 5.89543 3.89543 5 5 5H9ZM5 7V9H19V7H5ZM19 11H5V19H19V11Z" fill="#FF7643"/>
</svg>''';

const giftIcon =
    '''<svg width="19" height="22" viewBox="0 0 19 22" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M17.7359 13.1041H10.1321V7.58517L12.3791 9.79773C12.5023 9.92019 12.6635 9.98038 12.8257 9.98038C12.9869 9.98038 13.1491 9.92019 13.2724 9.79773C13.52 9.55592 13.52 9.16156 13.2724 8.91872L11.0338 6.71239H15.2076C16.6013 6.71239 17.7359 7.83009 17.7359 9.20308V13.1041ZM17.7359 18.2484C17.7359 19.6214 16.6013 20.7391 15.2076 20.7391H10.1321V14.3484H17.7359V18.2484ZM10.1321 3.35308C10.1321 2.18973 11.0918 1.2443 12.2716 1.2443C13.4504 1.2443 14.4101 2.18973 14.4101 3.35308C14.4101 4.51436 13.4504 5.45979 12.2716 5.45979H10.1321V3.35308ZM8.86793 5.45979H6.72943C5.54957 5.45979 4.58988 4.51436 4.58988 3.35308C4.58988 2.18973 5.54957 1.2443 6.72943 1.2443C7.90824 1.2443 8.86793 2.18973 8.86793 3.35308V5.45979ZM8.86793 13.1041H1.26414V9.20308C1.26414 7.83009 2.3987 6.71239 3.79242 6.71239H7.96723L5.7276 8.91872C5.48109 9.16156 5.48109 9.55592 5.7276 9.79773C5.97411 10.0416 6.37442 10.0416 6.62198 9.79773L8.86793 7.58517V13.1041ZM8.86793 20.7391H3.79242C2.3987 20.7391 1.26414 19.6214 1.26414 18.2484V14.3484H8.86793V20.7391ZM15.2076 5.46809H14.9095C15.3877 4.89004 15.6743 4.15425 15.6743 3.35308C15.6743 1.50375 14.1478 0 12.2716 0C11.1297 0 10.1184 0.556253 9.5 1.40827C8.88268 0.556253 7.87032 0 6.72943 0C4.85218 0 3.32574 1.50375 3.32574 3.35308C3.32574 4.15425 3.61228 4.89004 4.09054 5.46809H3.79242C1.70132 5.46809 0 7.14307 0 9.20308V18.2484C0 20.3084 1.70132 21.9844 3.79242 21.9844H9.35884C9.40414 21.9938 9.45154 22 9.5 22C9.54951 22 9.59586 21.9938 9.64116 21.9844H15.2076C17.2987 21.9844 19 20.3084 19 18.2484V9.20308C19 7.14307 17.2987 5.46809 15.2076 5.46809Z" fill="#FF7643"/>
</svg>
''';

const discoverIcon =
    '''<svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M15.481 15.1013C15.9771 14.8149 16.6122 14.9851 16.8986 15.4811C17.185 15.9772 17.0149 16.6123 16.5188 16.8987C16.0227 17.1851 15.3876 17.015 15.1012 16.5189C14.8148 16.0228 14.985 15.3877 15.481 15.1013ZM17.7272 18.9918L10.0163 19.4546L14.2726 13.0082L21.9835 12.5454L17.7272 18.9918ZM23.1527 11.2269L13.8876 11.783C13.6907 11.7948 13.5127 11.8976 13.4041 12.0622L8.28988 19.8079C8.16037 20.0049 8.15326 20.2583 8.27104 20.4623C8.38883 20.6663 8.61179 20.7868 8.84715 20.7731L18.1123 20.217C18.2104 20.2106 18.304 20.1818 18.3867 20.134C18.4694 20.0863 18.5412 20.0197 18.5958 19.9379L23.7099 12.1921C23.8395 11.9951 23.8466 11.7417 23.7288 11.5377C23.611 11.3337 23.388 11.2132 23.1527 11.2269ZM20.8773 24.4478C16.2184 27.1376 10.2414 25.5354 7.55208 20.8774C4.86279 16.2194 6.46366 10.242 11.1226 7.55217C15.7814 4.86236 21.7585 6.46465 24.4477 11.1226C27.137 15.7806 25.5362 21.758 20.8773 24.4478ZM10.4999 6.47372C5.24698 9.50651 3.44085 16.2471 6.47363 21.5C9.50642 26.7529 16.247 28.5591 21.4999 25.5263C26.7528 22.4935 28.559 15.7529 25.5262 10.5C22.4934 5.24707 15.7528 3.44094 10.4999 6.47372Z" fill="#FF7643"/>
</svg>
''';

const cartIcon =
    '''<svg width="22" height="18" viewBox="0 0 22 18" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M18.4524 16.6669C18.4524 17.403 17.8608 18 17.1302 18C16.3985 18 15.807 17.403 15.807 16.6669C15.807 15.9308 16.3985 15.3337 17.1302 15.3337C17.8608 15.3337 18.4524 15.9308 18.4524 16.6669ZM11.9556 16.6669C11.9556 17.403 11.3631 18 10.6324 18C9.90181 18 9.30921 17.403 9.30921 16.6669C9.30921 15.9308 9.90181 15.3337 10.6324 15.3337C11.3631 15.3337 11.9556 15.9308 11.9556 16.6669ZM20.7325 5.7508L18.9547 11.0865C18.6413 12.0275 17.7685 12.6591 16.7846 12.6591H10.512C9.53753 12.6591 8.66784 12.0369 8.34923 11.1095L6.30162 5.17154H20.3194C20.4616 5.17154 20.5903 5.23741 20.6733 5.35347C20.7563 5.47058 20.7771 5.61487 20.7325 5.7508ZM21.6831 4.62051C21.3697 4.18031 20.858 3.91682 20.3194 3.91682H5.86885L5.0002 1.40529C4.70961 0.564624 3.92087 0 3.03769 0H0.621652C0.278135 0 0 0.281266 0 0.62736C0 0.974499 0.278135 1.25472 0.621652 1.25472H3.03769C3.39158 1.25472 3.70812 1.48161 3.82435 1.8183L4.83311 4.73657C4.83622 4.74598 4.83934 4.75434 4.84245 4.76375L7.17339 11.5215C7.66531 12.9518 9.00721 13.9138 10.512 13.9138H16.7846C18.304 13.9138 19.6511 12.9383 20.1347 11.4859L21.9135 6.14917C22.0847 5.63369 21.9986 5.06175 21.6831 4.62051Z" fill="#7C7C7C"/>
</svg>
''';

const bellIcon =
    '''<svg width="15" height="20" viewBox="0 0 15 20" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M13.9645 15.8912C13.9645 16.1628 13.7495 16.3832 13.4844 16.3832H9.22765H9.21987H1.51477C1.2505 16.3832 1.03633 16.1628 1.03633 15.8912V10.7327C1.03633 7.08053 3.93546 4.10885 7.50043 4.10885C11.0645 4.10885 13.9645 7.08053 13.9645 10.7327V15.8912ZM7.50043 18.9381C6.77414 18.9381 6.18343 18.3327 6.18343 17.5885C6.18343 17.5398 6.18602 17.492 6.19034 17.4442H8.81052C8.81484 17.492 8.81743 17.5398 8.81743 17.5885C8.81743 18.3327 8.22586 18.9381 7.50043 18.9381ZM9.12488 3.2292C9.35805 2.89469 9.49537 2.48673 9.49537 2.04425C9.49537 0.915044 8.6024 0 7.50043 0C6.39847 0 5.5055 0.915044 5.5055 2.04425C5.5055 2.48673 5.64281 2.89469 5.87512 3.2292C2.51828 3.99204 0 7.06549 0 10.7327V15.8912C0 16.7478 0.679659 17.4442 1.51477 17.4442H5.15142C5.14883 17.492 5.1471 17.5398 5.1471 17.5885C5.1471 18.9186 6.20243 20 7.50043 20C8.79843 20 9.8529 18.9186 9.8529 17.5885C9.8529 17.5398 9.85117 17.492 9.84858 17.4442H13.4844C14.3203 17.4442 15 16.7478 15 15.8912V10.7327C15 7.06549 12.4826 3.99204 9.12488 3.2292Z" fill="#626262"/>
</svg>
''';
