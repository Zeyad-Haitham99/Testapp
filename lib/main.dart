import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TestApp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage());
  }
}

class Song extends StatefulWidget {
  const Song({this.title, this.author, this.like});
  final String title;
  final String author;
  final int like;

  @override
  _SongState createState() => _SongState();
}

class _SongState extends State<Song> {
  bool playing = false;
  IconData playBtn = Icons.play_arrow;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return new Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200.withOpacity(0.3),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 4.0, bottom: 4.0, right: 10.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8aHVtYW58ZW58MHx8MHw%3D&ixlib=rb-1.2.1&w=1000&q=80'),
                radius: 20.0,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(widget.title, style: textTheme.subtitle1),
                  new Text(widget.author, style: textTheme.caption),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: IconButton(
                  iconSize: 20.0,
                  color: Colors.black54,
                  onPressed: () {
                    if (!playing) {
                      setState(() {
                        playBtn = Icons.pause;
                        playing = true;
                      });
                    } else {
                      setState(() {
                        playBtn = Icons.play_arrow;
                        playing = false;
                      });
                    }
                  },
                  icon: Icon(playBtn),
                )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.whatshot_outlined, size: 25.0),
                    Text('${widget.like ?? ''}'),
                  ],
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        Song(title: 'Trapadelic lobo', author: 'lillobobeats', like: 4),
        Song(title: 'Different', author: 'younglowkey', like: 23),
        Song(title: 'Future', author: 'younglowkey', like: 2),
        Song(title: 'ASAP', author: 'tha_producer808', like: 13),
        Song(title: '🌲🌲🌲', author: 'TraphousePeyton'),
        Song(title: 'Something sweet...', author: '6ryan', like: 5),
        Song(title: 'Sharpie', author: 'Fergie_6', like: 10),
      ],
    );
  }
}

class CustomTabBar extends AnimatedWidget implements PreferredSizeWidget {
  CustomTabBar({this.pageController, this.pageNames})
      : super(listenable: pageController);
  final PageController pageController;
  final List<String> pageNames;
  @override
  // TODO: implement preferredSize
  final Size preferredSize = new Size(0.0, 40.0);
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return new Container(
      height: 40.0,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade800.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: new List.generate(pageNames.length, (int index) {
          return new InkWell(
              child: new Text(pageNames[index],
                  style: textTheme.subtitle1.copyWith(
                    color: Colors.white.withOpacity(
                      index == pageController.page ? 1.0 : 0.2,
                    ),
                  )),
              onTap: () {
                pageController.animateToPage(
                  index,
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 300),
                );
              });
        }).toList(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController = new PageController(initialPage: 2);

  @override
  Widget build(BuildContext context) {
    final Map<String, Widget> pages = <String, Widget>{
      'My Music': Center(
        child: Text('My music is not implemented'),
      ),
      'Shared': Center(
        child: Text('Shared is not implemented'),
      ),
      'Feed': Feed(),
    };
    TextTheme textTheme = Theme.of(context).textTheme;
    return new Stack(
      children: [
        new Container(
            decoration: new BoxDecoration(
                gradient: new LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                const Color.fromARGB(255, 253, 72, 72),
                const Color.fromARGB(255, 87, 97, 249),
              ],
              stops: [0.0, 1.0],
            )),
            child: new Align(
                alignment: FractionalOffset.bottomCenter,
                child: new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: new Text(
                    'T I Z E',
                    style: textTheme.headline5.copyWith(
                      color: Colors.grey.shade800.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ))),
        new Scaffold(
          backgroundColor: const Color(0x00000000),
          appBar: new AppBar(
            backgroundColor: const Color(0x00000000),
            elevation: 0.0,
            leading: new Center(
              child: new ClipOval(
                child: new Image.network(
                  'https://image.shutterstock.com/image-photo/surreal-image-african-elephant-wearing-260nw-1365289022.jpg',
                ),
              ),
            ),
            actions: [
              new IconButton(
                icon: new Icon(Icons.add),
                onPressed: () {
                  // TODO: implement
                },
              ),
            ],
            title: const Text('tofu\'s songs'),
            bottom: new CustomTabBar(
              pageController: _pageController,
              pageNames: pages.keys.toList(),
            ),
          ),
          body: new PageView(
            controller: _pageController,
            children: pages.values.toList(),
          ),
        ),
      ],
    );
  }
}
