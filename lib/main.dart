import 'package:flutter/material.dart';
import 'package:youtube/splashscreen.dart';
import 'secondpage.dart';
import 'videoslist.dart';

// Create an object of the Videoslist class to access video data
Videoslist obj = Videoslist();

// Main function that runs the app, with splashScreen as the initial screen
void main() => runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: splashScreen()));

// Main MyApp widget class
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// State class for MyApp where the main UI is built
class _MyAppState extends State<MyApp> {
  // Function to create video player widget, navigates to a detailed video page when clicked
  Widget vidplayer(int index) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondPage(
              video: obj.videolist[index],
              videolist: obj.videolist,
            ),
          ),
        );
      },
      style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display video thumbnail image
            ClipRRect(
              child: Image.network(
                obj.videolist[index].imageId,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Display video title and channel info with profile image
            ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(obj.videolist[index].profimage),
              ),
              title: Text(
                obj.videolist[index].text,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
              subtitle: Text(
                obj.videolist[index].info,
                style: TextStyle(color: Colors.grey[500]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to create text buttons with specified text
  Widget TextList(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          backgroundColor: const Color(0xDD303030),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
    );
  }

  @override
  // Main UI structure
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xAB181818),
      body: Stack(
        children: [
          // Scrollable list of video content
          ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Header row with logo and icons
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
                    child: Row(
                      children: [
                        // YouTube logo
                        ClipRRect(
                          child: Image.asset(
                            'images/youtube.png',
                            width: 50,
                          ),
                        ),
                        const Text(
                          "YouTube",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: 'Youtube',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 150),
                        // Icons for casting, notifications, and search
                        const Icon(
                          Icons.connected_tv_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                        const SizedBox(width: 20),
                        const Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 7, top: 4),
                              child: Icon(
                                Icons.notifications_none_sharp,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            Positioned(
                              bottom: 12,
                              left: 15,
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: Color(0xAB212121),
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.red,
                                  child: Text(
                                    "5",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        const Icon(
                          Icons.search_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  // Row of category buttons for filtering content
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                backgroundColor: const Color(0xDD303030),
                              ),
                              child: const Icon(
                                Icons.browse_gallery_outlined,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 5),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                              child: const Text(
                                "All",
                                style:
                                TextStyle(color: Colors.black, fontSize: 20),
                              ),
                            ),
                          ),
                          TextList("Music"),
                          TextList("Mixes"),
                          TextList("Gaming"),
                          TextList("Source Code"),
                          TextList("Test drives"),
                        ],
                      ),
                    ),
                  ),
                  // Generate a list of video players from the videolist
                  Column(
                    children: List.generate(obj.videolist.length, (index) {
                      return vidplayer(index);
                    }),
                  ),
                ],
              ),
              // Empty container to create space at the bottom
              Container(height: 150,)
            ],
          ),
          // Bottom navigation bar
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 90,
              width: double.infinity,
              color: const Color(0xFF111111),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Navigation icons for Home, Shorts, etc.
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home_filled, color: Colors.white, size: 30),
                      Text("Home",
                          style: TextStyle(color: Colors.white, fontSize: 11,fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.app_shortcut_outlined,
                          color: Colors.white, size: 30),
                      Text("Shorts",
                          style: TextStyle(color: Colors.white, fontSize: 11,fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 23,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: Color(0xFC181818),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 39,
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.subscriptions_outlined,
                          color: Colors.white, size: 28),
                      Text("Subscriptions",
                          style: TextStyle(color: Colors.white, fontSize: 11,fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundImage: AssetImage('images/profile.jpg'),
                      ),
                      Text("You",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
