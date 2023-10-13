import 'package:app_pda_lda/app/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingItem extends StatelessWidget {
  final double size;

  const LoadingItem({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
          height: size*1.5,
          width: size*1.5,
          child: SpinKitChasingDots(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(size)),
                  color: index.isEven ? AppColors.primary : AppColors.green2,
                ),
              );
            },
          ),
        ));
  }
}
