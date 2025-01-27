import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'rating.dart';

class DetailPage extends StatefulWidget {
  final String img;
  final String title;
  final String linkUrl; // Changed to lowerCamelCase
  final String description;

  const DetailPage({
    super.key,
    required this.title,
    required this.img,
    required this.linkUrl, // Changed from LINK_URL to linkUrl
    required this.description,
  });

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _rating = 0;
  late final Uri _url = Uri.parse(widget.linkUrl);

  bool _isLiked = false;
  bool _isDisliked = false;

  void _handleRatingChanged(int rating) {
    setState(() {
      _rating = rating;
    });
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ไม่สามารถเปิดลิงก์ $_url ได้')),
      );
    }
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      if (_isLiked) {
        _isDisliked = false; // Dislike is turned off when liking
      }
    });
  }

  void _toggleDislike() {
    setState(() {
      _isDisliked = !_isDisliked;
      if (_isDisliked) {
        _isLiked = false; // Like is turned off when disliking
      }
    });
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Handle navigation based on the selected index
    // For example:
    if (index == 0) {
      Navigator.pop(context); // Go back to the home page
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายละเอียด ${widget.title}'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(widget.img, height: 120, width: 120, fit: BoxFit.cover),
              const SizedBox(height: 10),
              Text(
                'รายละเอียด ${widget.title}',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.thumb_up,
                      color: _isLiked ? Colors.blue : Colors.grey,
                      size: 40,
                    ),
                    onPressed: _toggleLike,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.thumb_down,
                      color: _isDisliked ? Colors.red : Colors.grey,
                      size: 40,
                    ),
                    onPressed: _toggleDislike,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                _isLiked
                    ? "ชอบ"
                    : _isDisliked
                        ? "ไม่ชอบ"
                        : "",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              StarRating(
                key: const Key('star_rating'),
                value: _rating,
                filledStar: Icons.star,
                unfilledStar: Icons.star_border,
                onRatingChanged: _handleRatingChanged,
              ),
              const SizedBox(height: 10),
              Text('ให้ดาว: $_rating', style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _launchUrl,
                child: const Text("เปิดใน YouTube"),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าแรก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'อาหาร',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.no_drinks_sharp),
            label: 'ของว่าง',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
      ),
    );
  }
}
