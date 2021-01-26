import 'package:flutter/material.dart';
import 'package:sliver_header_delegate/sliver_header_delegate.dart';

const primaryColor = const Color(0xBE7A81FF);

class CompleteExample extends StatelessWidget {
  const CompleteExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final expandedStyle =
        theme.textTheme.headline4.copyWith(color: Colors.white);
    final collapsedStyle =
        theme.textTheme.headline6.copyWith(color: Colors.white);
    final padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 16);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: FlexibleHeaderDelegate(
              statusBarHeight: MediaQuery
                  .of(context)
                  .padding
                  .top,
              leading: const SizedBox(),
              expandedHeight: 240,
              background: MutableBackground(
                expandedWidget: Image.asset(
                  'assets/images/mountains.jpg',
                  fit: BoxFit.cover,
                ),
                collapsedColor: primaryColor,
              ),
              children: [
                FlexibleTextItem(
                  text: 'Mountains',
                  collapsedStyle: collapsedStyle,
                  expandedStyle: expandedStyle,
                  expandedAlignment: Alignment.bottomLeft,
                  collapsedAlignment: Alignment.center,
                  expandedPadding: padding,
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ListTile(
                  title: Text('(650) 555-1234'),
                  subtitle: Text('Mobile'),
                  leading: Icon(Icons.phone),
                  trailing: IconButton(
                    icon: Icon(Icons.message),
                    onPressed: () {},
                  ),
                ),
                ListTile(
                  title: Text('(323) 555-6789'),
                  subtitle: Text('Work'),
                  leading: SizedBox(),
                  trailing: IconButton(
                    icon: Icon(Icons.message),
                    onPressed: () {},
                  ),
                ),
                ListTile(
                  title: Text('(650) 555-6789'),
                  subtitle: Text('Home'),
                  leading: SizedBox(),
                  trailing: IconButton(
                    icon: Icon(Icons.message),
                    onPressed: () {},
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text('ali_connors@example.com'),
                  subtitle: Text('Personal'),
                  leading: Icon(Icons.contact_mail),
                  trailing: IconButton(
                    icon: Icon(Icons.mail),
                    onPressed: () {},
                  ),
                ),
                ListTile(
                  title: Text('aliconnors@example.com'),
                  subtitle: Text('Work'),
                  leading: SizedBox(),
                  trailing: IconButton(
                    icon: Icon(Icons.mail),
                    onPressed: () {},
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text('2000 Main Street\nSan Francisco, CA'),
                  subtitle: Text('Home'),
                  leading: Icon(Icons.location_on),
                  trailing: IconButton(
                    icon: Icon(Icons.map),
                    onPressed: () {},
                  ),
                ),
                ListTile(
                  title: Text('1600 Amphitheater Parkway\nMountain View, CA'),
                  subtitle: Text('Work'),
                  leading: SizedBox(),
                  trailing: IconButton(
                    icon: Icon(Icons.map),
                    onPressed: () {},
                  ),
                ),
                ListTile(
                  title: Text('126 Severyns Ave\nMountain View, CA'),
                  subtitle: Text('Jet Travel'),
                  leading: SizedBox(),
                  trailing: IconButton(
                    icon: Icon(Icons.map),
                    onPressed: () {},
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text('Birthday'),
                  subtitle: Text('January 9th, 1980'),
                  leading: Icon(Icons.calendar_today),
                ),
                ListTile(
                  title: Text('Wedding anniversary'),
                  subtitle: Text('June 24th, 2015'),
                  leading: SizedBox(),
                ),
                ListTile(
                  title: Text('First day in office'),
                  subtitle: Text('January 20th, 2015'),
                  leading: SizedBox(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
