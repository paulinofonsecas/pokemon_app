import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokemon_app/app/controllers/poke_details/poke_details_controller.dart';
import 'package:pokemon_app/app/models/pokemon.dart';

import 'about_poke.dart';

class SecaoBaixo extends StatefulWidget {
  SecaoBaixo({
    Key key,
    @required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  _SecaoBaixoState createState() => _SecaoBaixoState();
}

class _SecaoBaixoState extends State<SecaoBaixo>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  NumberFormat formater = NumberFormat('000');
  PokeDetailsController _pokeController;
  TabController _tabController;

  @override
  void initState() {
    _pokeController = PokeDetailsController();
    _tabController =
        TabController(vsync: this, length: 4, initialIndex: _currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  _buildTabBar(),
                  _buildActions(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildActions() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: [
          AboutPoke(
            pokemon: widget.pokemon,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: LayoutBuilder(
              builder: (context, size) {
                return Container(
                  width: size.maxWidth,
                  height: size.maxHeight,
                  child: _pokeController.buildPropertys(
                      widget.pokemon.stats, size),
                );
              },
            ),
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.brown,
          ),
        ],
      ),
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      labelColor: Colors.black,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      tabs: [
        Tab(
          text: 'About',
        ),
        Tab(
          text: 'Base stats',
        ),
        Tab(
          text: 'Evolution',
        ),
        Tab(
          text: 'Moves',
        ),
      ],
    );
  }
}
