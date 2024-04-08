class MovingAverage {
  MovingAverage({this.alpha = 0.9});
  double alpha;
  double bpm = 0;
  double hrv = 0;
  double si = 0;
  bool init = true;

  void update(List<double> rs) {
    final newbpm = rs[0];
    final newhrv = rs[1];
    final newsi = rs[2];

    if (init && (newbpm != 0 || newhrv != 0 || newsi != 0)) {
      bpm = newbpm;
      hrv = newhrv;
      si = newsi;
      init = false;
    } else {
      bpm = alpha * bpm + (1 - alpha) * bpm;
      hrv = alpha * hrv + (1 - alpha) * hrv;
      si = alpha * si + (1 - alpha) * si;
    }
  }
}
