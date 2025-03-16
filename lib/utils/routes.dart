import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/examples/sliver_app_bar_example.dart';
import '../screens/examples/sliver_list_example.dart';
import '../screens/examples/sliver_grid_example.dart';
import '../screens/examples/sliver_to_box_adapter_example.dart';
import '../screens/examples/sliver_fill_remaining_example.dart';
import '../screens/examples/sliver_persistent_header_example.dart';
import '../screens/examples/sliver_animated_list_example.dart';
import '../screens/examples/sliver_opacity_example.dart';
import '../screens/examples/sliver_padding_example.dart';
import '../screens/examples/sliver_layout_builder_example.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const HomeScreen(),
    '/sliver_app_bar': (context) => const SliverAppBarExample(),
    '/sliver_list': (context) => const SliverListExample(),
    '/sliver_grid': (context) => const SliverGridExample(),
    '/sliver_to_box_adapter': (context) => const SliverToBoxAdapterExample(),
    '/sliver_fill_remaining': (context) => const SliverFillRemainingExample(),
    '/sliver_persistent_header': (context) => const SliverPersistentHeaderExample(),
    '/sliver_animated_list': (context) => const SliverAnimatedListExample(),
    '/sliver_opacity': (context) => const SliverOpacityExample(),
    '/sliver_padding': (context) => const SliverPaddingExample(),
    '/sliver_layout_builder': (context) => const SliverLayoutBuilderExample(),
  };
}