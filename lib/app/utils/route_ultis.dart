import 'package:app_pda_lda/presentation/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

GoRouter? globalGoRouter;

GoRouter getGoRouter() {
  return globalGoRouter ??= MyApp.router;
}

void clearAndNavigate(BuildContext context ,String path) {
  while (context.canPop()) {
    context.pop();
  }
  context.pushReplacement(path);


  // Router.neglect(context, () {
  //   context.go(path);
  // });
}