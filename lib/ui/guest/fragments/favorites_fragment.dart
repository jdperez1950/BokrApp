import 'package:brokr/ui/widgets/item_card.dart';
import 'package:flutter/material.dart';

class FavoritesFragment extends StatelessWidget {
  const FavoritesFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'My Favorites',
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 4,
        itemBuilder: (_, i) {
          String image;
          switch (i) {
            case 3:
              image =
                  'https://media.gettyimages.com/id/153642886/es/foto/alegre-joven-montando-en-un-bote.jpg?s=612x612&w=gi&k=20&c=y4eBMQQokoc1euCgwfqWsXM5QhODmdAWVoKopWuQYTE=';
              break;
            case 2:
              image =
                  'https://static4.depositphotos.com/1000129/313/i/950/depositphotos_3139714-stock-photo-motor-yatch.jpg';
              break;
            case 1:
              image =
                  'https://cf.bstatic.com/xdata/images/hotel/max1024x768/271619464.jpg?k=9b269183149ff60cf826037d01b57c1091d2be5ac2e0f091a76ab48eaee0f987&o=&hp=1';
              break;
            case 0:
            default:
              image =
                  'https://imageio.forbes.com/specials-images/imageserve/6064c6802c761b99a89d1f21/0x0.jpg?format=jpg&crop=2375,1336,x0,y120,safe&width=1200';
              break;
          }
          return ItemCard(
            title: 'Luxury Villa 5bed/6bath waterfront',
            address: 'Miami Beach Florida, United States',
            rating: 4.5,
            image: image,
            price: 7490,
            price2: 7899,
            isFavourite: true,
            margin: const EdgeInsets.only(bottom: 20),
          );
        },
      ),
    );
  }
}
