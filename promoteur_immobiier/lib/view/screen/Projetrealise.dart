import 'package:flutter/material.dart';
import 'package:promoteur_immobiier/view/WIdgets/navbar.dart';
import '../../constants.dart';

class Realise extends StatelessWidget {
  const Realise({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: kMainColor,
              title: Text('Groupe Illence'),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                child: Center(
                  child: Text('Scroll to see the p bar'),
                ),
              ),
            ),
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container();
              }),
            ),
          ],
        ),
        bottomNavigationBar: Nav(),
      );
}
