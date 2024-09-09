abstract class SplashEvent {
  factory SplashEvent.delayTimeout() = DelayTimeoutEvent;
}

class DelayTimeoutEvent implements SplashEvent {
  DelayTimeoutEvent();
}
