import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_no/game/bloc/game_bloc.dart';
import 'package:tic_tac_no/game/data/models/square.dart';

// TODO override operator==
class SquareWidget extends StatelessWidget {
  final Square square;

  SquareWidget({this.square});

  @override
  Widget build(BuildContext context) {
    //print(square.player);
    return GestureDetector(
      onTap: () {
        BlocProvider.of<GameBloc>(context)
            .add(SquareTapped(square: this.square));
        print(
            'tapped ${square.parentInnerGrid.position.x},${square.parentInnerGrid.position.y},${square.position.x},${square.position.y}');
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xff7A9AD1),
            width: 1,
          ),
        ),
        child: Center(
          child: this.square.player != null
              ? Container(
                  width: 30,
                  height: 30,
                  child: CustomPaint(
                    painter: this.square.player.symbol,
                  ),
                )
              : SizedBox.shrink(),
        ),
      ),
    );
  }
}
