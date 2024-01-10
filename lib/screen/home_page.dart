import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: const Text("English Quiz",style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.transparent,),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple,
              Colors.purple,
              Colors.pink
            ]
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network("https://www.thesafaricollection.com/wp-content/uploads/2022/07/The-Safari-Collection-Hey-You-Giraffe-Manor-1.jpg",width: MediaQuery.of(context).size.width / 2,fit: BoxFit.cover,),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: () {}, child: Text("Bear",style: TextStyle(color: Colors.black),)),
                      ElevatedButton(onPressed: () {}, child: Text("Lion",style: TextStyle(color: Colors.black),)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: () {}, child: Text("Dragon",style: TextStyle(color: Colors.black),)),
                      ElevatedButton(onPressed: () {}, child: Text("Giraffe",style: TextStyle(color: Colors.black),)),
                    ],
                  ),
                  ElevatedButton(onPressed: () {}, child: Text("NEXT"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
