# sliver_header_delegate
This package provides a flexible sliver header delegate that allows easily customize your SliverHeader

## Getting Started

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
    ...
    sliver_header_delegate: ^0.0.1
```

Import in your project:

```dart
import 'package:sliver_header_delegate/sliver_header_delegate.dart';
```

Inside your `CustomScrollView` declare `SliverPersistentHeader` and set `FlexibleHeaderDelegate` as it's delegate

```dart
CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: FlexibleHeaderDelegate(),
        ),
      ],
    );
```

If you want your widget to fill the status bar, specify `statusBarHeight` parameter:

```dart
delegate: FlexibleHeaderDelegate(
            statusBarHeight: MediaQuery.of(context).padding.top,
          ),
```


# Examples

## Complete example

![](completed.gif)

```dart
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
              statusBarHeight: MediaQuery.of(context).padding.top,
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
                // List items here
              ],
            ),
          ),
        ],
      ),
    );
  }
```

## Mutable background

![](mutable_background.gif)


```dart
 SliverPersistentHeader(
            pinned: true,
            delegate: FlexibleHeaderDelegate(
              expandedHeight: 240,
              background: MutableBackground(
                expandedWidget: Image.network(_imageUrl, fit: BoxFit.cover),
                collapsedColor: _headerColor,
              ),
            ),
          ),
```


## Gradient background

![](gradient_background.gif)


```dart
  SliverPersistentHeader(
            pinned: true,
            delegate: FlexibleHeaderDelegate(
              background: GradientBackground(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    _startColor,
                    _endColor,
                  ],
                ),
              ),
            ),
          ),
```


## Modified title

![](modified_title.gif)


```dart
    SliverPersistentHeader(
              pinned: true,
              delegate: FlexibleHeaderDelegate(
                backgroundColor: Colors.white,
                children: [
                  FlexibleTextItem(
                    text: 'Modified title',
                    expandedStyle: _expandedTextStyle,
                    collapsedStyle: _collapsedTextStyle,
                    expandedAlignment: Alignment.bottomLeft,
                    collapsedAlignment: Alignment.center,
                    expandedPadding: _expandedPadding,
                  ),
                ],
              ),
            ),
```
