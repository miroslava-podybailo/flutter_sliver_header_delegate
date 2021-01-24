
## Mutable background

![](mutable_background.gif)


```
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


```
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


```
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


## Customized items

![](customized_items.gif)


```
     SliverPersistentHeader(
                pinned: true,
                delegate: FlexibleHeaderDelegate(
                    backgroundColor: _headerColor,
                    children: [
                      FlexibleHeaderItem(
                        child: _DartLogo(),
                        options: [HeaderItemOptions.hide],
                        alignment: Alignment.centerRight,
                        expandedPadding: _expandedPadding,
                      ),
                      FlexibleHeaderItem(
                        child: _FlutterLogo(),
                        options: [HeaderItemOptions.scale],
                        alignment: Alignment.centerLeft,
                        expandedPadding: _expandedPadding,
                      ),
                    ]),
              ),
```
