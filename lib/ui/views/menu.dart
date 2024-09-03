import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glowy_borders/glowy_borders.dart';

import '../../constants/strings.dart';
import '../../core/router.dart';
import '../../viewmodels/menu.dart';
import '../components/glow_text.dart';
import '../theme.dart';
import 'base.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<MenuViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 60,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Expanded>[
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _buildMenuItem(
                          context,
                          title: 'directions',
                          route: AppRoutes.directionsGame,
                          enabled: true,
                          icon: FontAwesomeIcons.arrowsAlt,
                        ),
                        _buildMenuItem(
                          context,
                          title: 'arithmetic',
                          route: AppRoutes.mathsGame,
                          enabled: true,
                          icon: FontAwesomeIcons.waveSquare,
                        ),
                        _buildMenuItem(
                          context,
                          title: 'communication',
                          enabled: false,
                          icon: FontAwesomeIcons.stream,
                        ), // TODO: Enable according to value in LocalStorage
                        _buildMenuItem(context, enabled: false),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _buildMenuItem(context, enabled: false),
                        _buildMenuItem(context, enabled: false),
                        _buildMenuItem(context, enabled: false),
                        _buildMenuItem(
                          context,
                          title: 'information',
                          route: AppRoutes.credits,
                          enabled: true,
                          icon: FontAwesomeIcons.fileInvoice,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    String title = '',
    String route = AppRoutes.menu,
    required bool enabled,
    IconData icon = FontAwesomeIcons.ellipsisH,
  }) {
    final color = primary.withOpacity(enabled ? 1 : 0.5);

    return Expanded(
      child: AnimatedGradientBorder(
        borderRadius: BorderRadius.circular(15),
        borderSize: 1,
        glowSize: 3,
        gradientColors: <Color>[color],
        animationProgress: 0,
        child: InkWell(
          onTap: () {
            if (enabled) {
              Get.toNamed(
                route,
                arguments: cameFromMenu,
              );
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: background,
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Icon(
                    icon,
                    size: 50,
                    color: color,
                  ),
                ),
                if (title.isNotEmpty)
                  GlowText(
                    text: title,
                    glowColor: primary,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: color),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
