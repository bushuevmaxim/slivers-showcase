import 'package:flutter/material.dart';

class SliverExample {
  final String title;
  final String description;
  final String route;
  final IconData icon;

  const SliverExample({
    required this.title,
    required this.description,
    required this.route,
    required this.icon,
  });
}

final List<SliverExample> sliverExamples = [
  const SliverExample(
    title: 'SliverAppBar',
    description: 'A material design app bar that integrates with a CustomScrollView.',
    route: '/sliver_app_bar',
    icon: Icons.app_settings_alt,
  ),
  const SliverExample(
    title: 'SliverList',
    description: 'A sliver that places multiple box children in a linear array.',
    route: '/sliver_list',
    icon: Icons.list,
  ),
  const SliverExample(
    title: 'SliverGrid',
    description: 'A sliver that places multiple box children in a two dimensional arrangement.',
    route: '/sliver_grid',
    icon: Icons.grid_on,
  ),
  const SliverExample(
    title: 'SliverToBoxAdapter',
    description: 'A sliver that contains a single box widget.',
    route: '/sliver_to_box_adapter',
    icon: Icons.view_agenda,
  ),
  const SliverExample(
    title: 'SliverFillRemaining',
    description: 'A sliver that fills the remaining space in the viewport.',
    route: '/sliver_fill_remaining',
    icon: Icons.fullscreen,
  ),
  const SliverExample(
    title: 'SliverPersistentHeader',
    description: 'A sliver that displays a persistent header that stays visible at the start of the viewport.',
    route: '/sliver_persistent_header',
    icon: Icons.sticky_note_2,
  ),
  const SliverExample(
    title: 'SliverAnimatedList',
    description: 'A sliver that animates items when they are inserted or removed.',
    route: '/sliver_animated_list',
    icon: Icons.animation,
  ),
  const SliverExample(
    title: 'SliverOpacity',
    description: 'A sliver that makes its sliver child partially transparent.',
    route: '/sliver_opacity',
    icon: Icons.opacity,
  ),
  const SliverExample(
    title: 'SliverPadding',
    description: 'A sliver that adds padding on each side of another sliver.',
    route: '/sliver_padding',
    icon: Icons.padding,
  ),
  const SliverExample(
    title: 'SliverLayoutBuilder',
    description: 'A sliver that defers its building until layout.',
    route: '/sliver_layout_builder',
    icon: Icons.auto_awesome_mosaic,
  ),
];