part of spark.util;

class Time{
  
  double _milliseconds = 0.0;
  
  Time(this._milliseconds);
  
  Time.fromSeconds(double seconds){
    this._milliseconds = seconds*1000;
  }
  
  Time.now() : this(new DateTime.now().millisecondsSinceEpoch.toDouble());
  
  bool get isPositive => _milliseconds > 0;
  
  double get milliseconds => _milliseconds;
  double get seconds => milliseconds/1000.0;
  
  Time operator-(Time other) => new Time(this.milliseconds - other.milliseconds);
  Time operator+(Time other) => new Time(this.milliseconds + other.milliseconds);
  
  bool operator<(Time other) => this.milliseconds < other.milliseconds;
  bool operator>(Time other) => this.milliseconds > other.milliseconds;
  bool operator==(Time other) => this.milliseconds == other.milliseconds;
  
  bool operator<=(Time other) => this.milliseconds <= other.milliseconds;
  bool operator>=(Time other) => this.milliseconds >= other.milliseconds;
}