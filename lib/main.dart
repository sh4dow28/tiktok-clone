import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';

void main(){
  runApp(const TikTakApp());
}


class TikTakApp extends StatelessWidget {
  const TikTakApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TikTak",
      debugShowCheckedModeBanner: false,
      home: MyBody(),
    );
  }
}

class MyBody extends StatefulWidget {
  const MyBody({ Key? key }) : super(key: key);

  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
    int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Business',
      style: optionStyle,
    ),
    Text(
      'Index 4: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('TikTak'),
      //   centerTitle: true,
      // ),

      // body: Center(
      //   child: _widgetOptions.elementAt(_selectedIndex),
      // ),
      body: PageBody(),
      bottomNavigationBar: BottomNavigationBar(

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Discovery',
          ),
          BottomNavigationBarItem(
            // icon: Image.asset('assets/images/tiktok_add.png', height: 40,),
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userCircle,),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.album_outlined),
            label: 'Me',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF010101),
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xFF808080),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class PageBody extends StatelessWidget {
  PageBody({Key? key}) : super(key: key);
  final List<Map> tryItems = [
    {
      "video": "videos/video_1.mp4",
      "title": "Title one",
    },

    {
      "video": "videos/video_2.mp4",
      "title": "Title two",
    },

    {
      "video": "videos/video_3.mp4",
      "title": "Title tree",
    },

    {
      "video": "videos/video_4.mp4",
      "title": "Title four",
    },

    {
      "video": "videos/video_5.mp4",
      "title": "Title five",
    },

    {
      "video": "videos/video_6.mp4",
      "title": "Title six",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      
      options: CarouselOptions(
        height: double.infinity,
        scrollDirection: Axis.vertical,
        viewportFraction: 1.0,
      ),
      items: tryItems.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                color: Colors.blueGrey[700],
                child: Stack(
                  children: [
                    PostVideo(PostVideoPath: item['video'],),
                    // Container(
                    //   child: Center(child: Image.asset('images/img_test.jpg')),
                    // ),
                    PostInfo(),
                  ],
                )
            );
          },
        );
      }).toList(),
    );
  }
}

class PostVideo extends StatefulWidget {
  const PostVideo({ Key? key, required this.PostVideoPath }) : super(key: key);

  final String PostVideoPath;
  @override
  _PostVideoState createState() => _PostVideoState(this.PostVideoPath);
}

class _PostVideoState extends State<PostVideo> {
  
  late VideoPlayerController _controller;
  final String PostVideoPath;
  _PostVideoState(this.PostVideoPath);
  @override
   void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(PostVideoPath)
      ..initialize().then((_) {
        _controller.play();
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(
      _controller,
    );
  }
}


class PostInfo extends StatelessWidget {
  const PostInfo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 90, color: Colors.blue.withOpacity(0.5),),

        Expanded(
          child: Row(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(color: Colors.black,),
                    Container(width: 90, color: Colors.teal[600])
                  ],
                ),
              ),
            ],
          )
        )
      ],
    );
  }
}