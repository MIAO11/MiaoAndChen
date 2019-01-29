import 'package:flutter/material.dart';
import 'package:manhua/util/redux/ThemeRedux.dart';

class MkState {
  ///主题数据
  ThemeData themeData;
  ///构造方法
  MkState({ this.themeData});
}

///创建 Reducer
///源码中 Reducer 是一个方法 typedef State Reducer<State>(State state, dynamic action);
///我们自定义了 appReducer 用于创建 store
MkState appReducer(MkState state, action) {
  return MkState(
    ///通过 ThemeDataReducer 将 GSYState 内的 themeData 和 action 关联在一起
    themeData: ThemeDataReducer(state.themeData, action),
  );
}