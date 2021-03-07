import 'package:flutter/material.dart';
import 'package:sliver_header_delegate/sliver_header_delegate.dart';

const primaryColor = Color(0xBE7A81FF);

class CompleteExample extends StatelessWidget {
  const CompleteExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final expandedStyle =
        theme.textTheme.headline4.copyWith(color: Colors.white);
    final collapsedStyle =
        theme.textTheme.headline6.copyWith(color: Colors.white);
    const padding = EdgeInsets.symmetric(horizontal: 16, vertical: 16);

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: FlexibleHeaderDelegate(
              statusBarHeight: MediaQuery.of(context).padding.top,
              expandedHeight: 240,
              background: MutableBackground(
                expandedWidget: Image.asset(
                  'assets/images/mountains.jpg',
                  fit: BoxFit.cover,
                ),
                collapsedColor: primaryColor,
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ],
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
          const _SliverList(),
        ],
      ),
    );
  }
}

class _SliverList extends StatelessWidget {
  const _SliverList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          ListTile(
            title: const Text('(650) 555-1234'),
            subtitle: const Text('Mobile'),
            leading: const Icon(Icons.phone),
            trailing: IconButton(
              icon: const Icon(Icons.message),
              onPressed: () {},
            ),
          ),
          ListTile(
            title: const Text('(323) 555-6789'),
            subtitle: const Text('Work'),
            leading: const SizedBox(),
            trailing: IconButton(
              icon: const Icon(Icons.message),
              onPressed: () {},
            ),
          ),
          ListTile(
            title: const Text('(650) 555-6789'),
            subtitle: const Text('Home'),
            leading: const SizedBox(),
            trailing: IconButton(
              icon: const Icon(Icons.message),
              onPressed: () {},
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('ali_connors@example.com'),
            subtitle: const Text('Personal'),
            leading: const Icon(Icons.contact_mail),
            trailing: IconButton(
              icon: const Icon(Icons.mail),
              onPressed: () {},
            ),
          ),
          ListTile(
            title: const Text('aliconnors@example.com'),
            subtitle: const Text('Work'),
            leading: const SizedBox(),
            trailing: IconButton(
              icon: const Icon(Icons.mail),
              onPressed: () {},
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('2000 Main Street\nSan Francisco, CA'),
            subtitle: const Text('Home'),
            leading: const Icon(Icons.location_on),
            trailing: IconButton(
              icon: const Icon(Icons.map),
              onPressed: () {},
            ),
          ),
          ListTile(
            title: const Text('1600 Amphitheater Parkway\nMountain View, CA'),
            subtitle: const Text('Work'),
            leading: const SizedBox(),
            trailing: IconButton(
              icon: const Icon(Icons.map),
              onPressed: () {},
            ),
          ),
          ListTile(
            title: const Text('126 Severyns Ave\nMountain View, CA'),
            subtitle: const Text('Jet Travel'),
            leading: const SizedBox(),
            trailing: IconButton(
              icon: const Icon(Icons.map),
              onPressed: () {},
            ),
          ),
          const Divider(),
          const ListTile(
            title: Text('Birthday'),
            subtitle: Text('January 9th, 1980'),
            leading: Icon(Icons.calendar_today),
          ),
          const ListTile(
            title: Text('Wedding anniversary'),
            subtitle: Text('June 24th, 2015'),
            leading: SizedBox(),
          ),
          const ListTile(
            title: Text('First day in office'),
            subtitle: Text('January 20th, 2015'),
            leading: SizedBox(),
          ),
        ],
      ),
    );
  }
}
