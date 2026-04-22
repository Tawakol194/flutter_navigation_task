import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Arial', // يمكنك تغيير الخط لما يناسبك
      ),
      // نقطة البداية ستكون صفحة الدخول
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: GirlyLoginScreen(),
      ),
    ));

// --- 1. صفحة الدخول: تصميم رقيق ومتناسق ---
class GirlyLoginScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink[50]!, Colors.white],
            begin: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // أيقونة ترحيبية رقيقة
              Icon(Icons.face_retouching_natural, size: 80, color: Colors.pink[300]),
              SizedBox(height: 20),
              Text(
                'تسجيل دخول الأنيقات',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink[800]),
              ),
              SizedBox(height: 30),
              // حقل اسم المستخدم
              TextField(
                controller: nameController,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: 'اسمكِ الجميل',
                  prefixIcon: Icon(Icons.person_outline, color: Colors.pink[300]),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 15),
              // حقل كلمة المرور
              TextField(
                obscureText: true,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: 'كلمة المرور',
                  prefixIcon: Icon(Icons.lock_outline, color: Colors.pink[300]),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 25),
              // زر الدخول المتناسق
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[400],
                  shape: StadiumBorder(),
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  elevation: 5,
                ),
                child: Text('دخول للمتجر', style: TextStyle(color: Colors.white, fontSize: 18)),
                onPressed: () {
                  // الانتقال للشاشة الرئيسية
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => GirlyStoreHome()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- 2. الشاشة الرئيسية: تصميم رقيق باللون الوردي ---
class GirlyStoreHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('متجر الأناقة'),
        backgroundColor: Colors.pink[300],
        elevation: 5,
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.white, Colors.pink[50]!], begin: Alignment.topCenter),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.auto_awesome, size: 80, color: Colors.pink[300]),
            SizedBox(height: 25),
            Text('مرحباً بكِ في متجرنا', style: TextStyle(fontSize: 22, color: Colors.pink[800], fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[400],
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text('تفاصيل: طقم إكسسوارات', style: TextStyle(color: Colors.white, fontSize: 16)),
              onPressed: () async {
                final note = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AccessoryDetails(productLabel: 'طقم إكسسوارات'),
                  ),
                );

                if (note != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(note, textAlign: TextAlign.center),
                      backgroundColor: Colors.pink[400],
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

// --- 3. شاشة التفاصيل: ناعمة ومركزة ---
class AccessoryDetails extends StatelessWidget {
  final String productLabel;

  AccessoryDetails({required this.productLabel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('معلومات القطعة'),
        backgroundColor: Colors.pink[200],
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.pink[50],
                child: Icon(Icons.shopping_bag_outlined, size: 50, color: Colors.pink),
              ),
              SizedBox(height: 20),
              Text('القطعة: $productLabel', style: TextStyle(fontSize: 20, color: Colors.pink[900])),
              SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context, 'تم إضافة $productLabel للطلبات ✨');
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.pink[100],
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.pink[300]!),
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add_shopping_cart, color: Colors.pink[700]),
                      SizedBox(width: 10),
                      Text('أضيفي للطلب', style: TextStyle(color: Colors.pink[700], fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}