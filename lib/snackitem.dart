import 'detail.dart';
import 'package:flutter/material.dart';

class SnackItem extends StatelessWidget {
  final String imageUrl;
  final String link_url;
  final String title;
  final String description;

  const SnackItem(
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
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(2, 2))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageUrl, height: 80, width: 80, fit: BoxFit.cover),
          const SizedBox(height: 8),
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
            child: const Text('รายละเอียดของว่าง'),
          ),
        ],
      ),
    );
  }
}
