import 'package:flutter/material.dart';

abstract mixin class LifecycleAware {
  void onResume(Route? previousRoute) {}

  void onPause(Route? nextRoute) {}
}

class LifecycleObserver<R extends Route<dynamic>> extends NavigatorObserver {
  static final LifecycleObserver _default = LifecycleObserver();

  static LifecycleObserver getDefault() {
    return _default;
  }

  final Map<R, Set<LifecycleAware>> _listeners = <R, Set<LifecycleAware>>{};

  void subscribe(LifecycleAware aware, R route) {
    final Set<LifecycleAware> subscribers =
        _listeners.putIfAbsent(route, () => <LifecycleAware>{});
    if (subscribers.add(aware)) {
      // didPush
      aware.onResume(null);
    }
  }

  void unsubscribe(LifecycleAware aware) {
    final List<R> routes = _listeners.keys.toList();
    for (final R route in routes) {
      final Set<LifecycleAware>? subscribers = _listeners[route];
      if (subscribers != null) {
        subscribers.remove(aware);
        if (subscribers.isEmpty) {
          _listeners.remove(route);
        }
      }
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route is R && previousRoute is R) {
      final List<LifecycleAware>? previousSubscribers =
          _listeners[previousRoute]?.toList();

      if (previousSubscribers != null && isAwareRoute(route)) {
        for (final LifecycleAware aware in previousSubscribers) {
          // didPopNext(previousRoute = route)
          aware.onResume(route);
        }
      }

      final List<LifecycleAware>? subscribers = _listeners[route]?.toList();

      if (subscribers != null) {
        for (final LifecycleAware aware in subscribers) {
          // didPop
          aware.onPause(null);
        }
      }
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route is R && previousRoute is R) {
      final Set<LifecycleAware>? previousSubscribers =
          _listeners[previousRoute];

      if (previousSubscribers != null && isAwareRoute(route)) {
        for (final LifecycleAware aware in previousSubscribers) {
          // didPushNext(nextRoute = route)
          aware.onPause(route);
        }
      }
    }
  }

  bool isAwareRoute(Route route) {
    // Dialog路由默认名字为null
    return route.settings.name != null;
  }
}

mixin DefaultLifecyclerAwareState<T extends StatefulWidget> on State<T>
    implements LifecycleAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    LifecycleObserver.getDefault().subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    LifecycleObserver.getDefault().unsubscribe(this);
    super.dispose();
  }

  @override
  void onResume(Route? previousRoute) {
    debugPrint("onResume ${ModalRoute.settingsOf(context)?.name}");
  }

  @override
  void onPause(Route? nextRoute) {
    debugPrint("onPause ${ModalRoute.settingsOf(context)?.name}");
  }
}
