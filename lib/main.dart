//ศิวกร
import 'package:flutter/material.dart';
import 'var.dart';
import 'snackitem.dart';
import 'fooditem.dart';
import 'detail.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FoodSnackApp());
}

class FoodSnackApp extends StatelessWidget {
  const FoodSnackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => FoodSnackPage(),
        '/food1': (context) => DetailPage(
              title: 'ข้าวผัดกุ้ง',
              img: 'images/fff.jpg',
              link_url: 'https://youtu.be/AvR_dM6qsWM?si=5yVlOHas-JmSPuDh',
              description:
                  'ผัดไทยเป็นอาหารไทยที่มีชื่อเสียงไปทั่วโลก มีต้นกำเนิดในประเทศไทยและเป็นหนึ่งในอาหารที่ถือว่าเป็นสัญลักษณ์ของชาติ ผัดไทยประกอบไปด้วยเส้นก๋วยเตี๋ยวผัดกับไข่, กุ้ง, ถั่วงอก, และน้ำซอสสูตรเฉพาะ',
            ),
        '/food2': (context) => DetailPage(
              title: 'ผัดไทย',
              img: 'images/ffff.jpg',
              link_url: 'https://youtu.be/AvR_dM6qsWM?si=5yVlOHas-JmSPuDh',
              description:
                  'ผัดไทยเป็นอาหารไทยที่มีชื่อเสียงไปทั่วโลก มีต้นกำเนิดในประเทศไทยและเป็นหนึ่งในอาหารที่ถือว่าเป็นสัญลักษณ์ของชาติ ผัดไทยประกอบไปด้วยเส้นก๋วยเตี๋ยวผัดกับไข่, กุ้ง, ถั่วงอก, และน้ำซอสสูตรเฉพาะ',
            ),
        '/food3': (context) => DetailPage(
            title: 'แกงเขียวหวานไก่',
            img: 'images/gg.jpg',
            link_url: 'https://youtu.be/eeGIrnqV7J8?si=ZQI_100Psi_G6uwo',
            description:
                'แกงเขียวหวานไก่เป็นอาหารไทยที่มีต้นกำเนิดจากภาคกลางของประเทศไทย โดยใช้เครื่องแกงเขียวหวานที่ทำจากพริกเขียว, มะเขือ, กะทิ, และสมุนไพรต่างๆ ที่มีกลิ่นหอมและรสชาติเข้มข้น'),
        '/food4': (context) => DetailPage(
            title: 'หมูกรอบ',
            img: 'images/fs.jpg',
            link_url: 'https://youtu.be/96cSwQOenX8?si=YmBiBDmHrXuLADF2',
            description:
                'หมูกรอบเป็นอาหารไทยที่นิยมในหลายภาค โดยการนำหมูไปทอดจนกรอบและเสิร์ฟพร้อมกับน้ำจิ้มที่มีรสชาติเข้มข้น หมูกรอบถือเป็นอาหารยอดนิยมที่พบได้ในร้านอาหารและตลาดทั่วไทย'),
        '/sneck1': (context) => DetailPage(
            title: 'ขนมปังปิ้ง',
            img: 'images/pan.jpg',
            link_url: 'https://youtu.be/KbK0dGwd6vc?si=mfJdfOZSuc5NIetG',
            description:
                'ขนมปังปิ้งเป็นขนมที่มีต้นกำเนิดในประเทศไทย โดยการนำขนมปังมาปิ้งจนกรอบและเสิร์ฟพร้อมเนยและน้ำตาล หรือบางครั้งจะเพิ่มท็อปปิ้งต่างๆ เช่น ช็อกโกแลตหรือสังขยา'),
        '/sneck2': (context) => DetailPage(
            title: 'ทาโกะยากิ',
            img: 'images/ta.jpg',
            link_url: 'https://youtu.be/_l0XcOuI2qA?si=XNQ-hbYAgo29mPAN',
            description:
                "ทาโกะยากิเป็นของว่างที่มีต้นกำเนิดจากประเทศญี่ปุ่น โดยจะทำจากแป้งที่มีไส้เป็นปลาหมึก (หรือที่เรียกว่า 'ทาโก') ทอดในพิมพ์เป็นรูปกลมและเสิร์ฟพร้อมซอสทาโกะยากิที่หวานและเค็ม"),
        '/sneck3': (context) => DetailPage(
            title: 'กล้วยทอด',
            img: 'images/kuay.jpg',
            link_url: 'https://youtu.be/4cbkOtNNqZw?si=-0fjHjoMEjEG_lf0',
            description:
                'กล้วยทอดเป็นขนมที่มีต้นกำเนิดในประเทศไทยและบางประเทศในเอเชียตะวันออกเฉียงใต้ โดยการนำกล้วยที่สุกแล้วไปคลุกแป้งและทอดจนกรอบ รสชาติหวานและกรอบอร่อย นิยมเป็นของว่างหรือขนมเบาๆ'),
      },
      debugShowCheckedModeBanner: false,
      home: const FoodSnackPage(),
    );
  }
}

class FoodSnackPage extends StatelessWidget {
  const FoodSnackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('แนะนำอาหารและของว่าง'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          // Food section
          Container(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              'อาหาร',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(8.0),
              children: foodItems.map((item) {
                return FoodItem(
                    imageUrl: item["imageUrl"] ?? '',
                    link_url: item["link_url"] ?? '',
                    title: item["title"] ?? '',
                    description: item['description'] ?? "");
              }).toList(),
            ),
          ),
          // Snack section
          Container(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              'ของว่าง',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(10.0),
              children: snackItems.map((item) {
                return SnackItem(
                    imageUrl: item["imageUrl"] ?? '',
                    link_url: item["link_url"] ?? '',
                    title: item["title"] ?? '',
                    description: item['description'] ?? '');
              }).toList(),
            ),
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}

//Sivakorn
