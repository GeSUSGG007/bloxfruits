import 'package:flutter/material.dart';
import 'detail.dart';

class FoodItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String link_url;
  final String description;

  const FoodItem(
      {super.key,
      required this.imageUrl,
      required this.link_url,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        // image: DecorationImage(image: NetworkImage(imageUrl)),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(2, 2))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageUrl, height: 90, width: 90, fit: BoxFit.fill),
          Text(title, style: const TextStyle(fontSize: 16)),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                      title: title,
                      img: imageUrl,
                      link_url: link_url,
                      description: description),
                ),
              );
            },
            child: const Text(
              'ดูรายละเอียด',
            ),
          ),
        ],
      ),
    );
  }
}
