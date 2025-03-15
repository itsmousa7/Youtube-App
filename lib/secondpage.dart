import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'videosclass.dart';

// Stateful widget for the second page of the app
class SecondPage extends StatefulWidget {
  // Variables to hold video details and video list
  final Videosclass video;
  final List<Videosclass> videolist;

  const SecondPage({super.key, required this.video, required this.videolist});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // YoutubePlayerController for managing video playback
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      // Initialize player with video ID and playback settings
      initialVideoId: widget.video.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        enableCaption: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentVideo = widget.video;

    return Scaffold(
      backgroundColor: const Color(0xFF181818),
      body: ListView(
        children: [
          Stack(
            children: [
              YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.greenAccent,
                  progressColors: const ProgressBarColors(
                    playedColor: Colors.red,
                    handleColor: Colors.red,
                  ),
                ),
                builder: (context, player) => Column(
                  children: [
                    player,
                    const SizedBox(height: 20),
                    // Displaying video title and views count
                    ListTile(
                      title: Text(
                        currentVideo.text,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      subtitle: Text(
                        currentVideo.views,
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    // Channel info with profile picture and subscription option
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(currentVideo.profimage),
                      ),
                      title: Row(
                        children: [
                          Text(
                            currentVideo.channelname,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            currentVideo.subscription,
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      trailing: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(29)),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          child: Text(
                            "Subscribe",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    // Action buttons like like, share, remix, etc.
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Card(
                              color: const Color(0xAB303030),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Icon(Icons.thumb_up_alt_outlined,
                                        color: Colors.white),
                                    Text(
                                      currentVideo.likes,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(left: 10)),
                                    Container(
                                        width: 1,
                                        height: 20,
                                        color: Colors.grey[500]),
                                    const Padding(
                                        padding: EdgeInsets.only(left: 10)),
                                    const Icon(Icons.thumb_down_alt_outlined,
                                        color: Colors.white)
                                  ],
                                ),
                              ),
                            ),
                            // Other buttons for sharing, remixing, clipping, saving, and reporting
                            Card(
                              color: const Color(0xAB303030),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28)),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.ios_share_outlined,
                                        color: Colors.white, size: 20),
                                    Text(" Share",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17)),
                                  ],
                                ),
                              ),
                            ),
                            // Additional buttons for Remix, Clip, Save, Report actions
                            Card(
                              color: const Color(0xAB303030),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28)),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.video_collection_outlined,
                                        color: Colors.white, size: 20),
                                    Text(" Remix",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17)),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              color: const Color(0xAB303030),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28)),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.content_cut_outlined,
                                        color: Colors.white, size: 20),
                                    Text(" Clip",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17)),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              color: const Color(0xAB303030),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28)),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.bookmark_border_outlined,
                                        color: Colors.white, size: 20),
                                    Text(" Save",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17)),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              color: const Color(0xAB303030),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28)),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.flag_outlined,
                                        color: Colors.white, size: 20),
                                    Text(" Report",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Display related video suggestions
                    Column(
                      children: widget.videolist
                          .map((video) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SecondPage(
                                          video: video,
                                          videolist: widget.videolist,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Video thumbnail
                                      ClipRRect(
                                        child: Image.network(
                                          video.imageId,
                                          width: double.infinity,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      // Video title and logo
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 20,
                                            backgroundImage:
                                                NetworkImage(video.profimage),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Text(
                                              video.text,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 50),
                                        child: Text(
                                          video.info,
                                          style: TextStyle(
                                              color: Colors.grey[500]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 10,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.keyboard_arrow_down_outlined,
                      color: Colors.white, size: 30),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
