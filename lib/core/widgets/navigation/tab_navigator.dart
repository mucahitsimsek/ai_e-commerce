import 'package:ai_ecommerce/core/widgets/navigation/tab_item.dart';
import 'package:flutter/cupertino.dart';

class TabNavigator extends StatefulWidget {
  final List<TabItem> tabs;
  final int selectedIndex;
  final bool popStack;

  const TabNavigator({
    Key? key,
    required this.tabs,
    required this.selectedIndex,
    this.popStack = false,
  }) : super(key: key);

  @override
  TabNavigatorState createState() => TabNavigatorState();
}

class TabNavigatorState extends State<TabNavigator> {
  ///
  /// Try to pop widget, return true if popped
  ///
  Future<bool> maybePop() {
    return widget.tabs[widget.selectedIndex].key.currentState!.maybePop();
  }

  _popStackIfRequired(BuildContext context) async {
    if (widget.popStack) {
      widget.tabs[widget.selectedIndex].key.currentState!
          .popUntil((route) => route.isFirst);
    }
  }

  @override
  Widget build(BuildContext context) {

    _popStackIfRequired(context);

    return Stack(
      children: List.generate(widget.tabs.length, _buildTab),
    );
  }

  Widget _buildTab(int index) {
    return Offstage(
      offstage: widget.selectedIndex != index,
      child: Opacity(
        opacity: widget.selectedIndex == index ? 1.0 : 0.0,
        child: Navigator(
          key: widget.tabs[index].key,
          onGenerateRoute: (settings) => CupertinoPageRoute(
            settings: settings,
            builder: (_) => widget.tabs[index].tab,
          ),
        ),
      ),
    );
  }
}
