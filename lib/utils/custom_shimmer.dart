import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum ShimmerDirection { ltr, rtl, ttb, btt }

class CustomShimmer extends StatefulWidget {
  final Widget child;
  final Duration period;
  final ShimmerDirection direction;
  final Gradient gradient;
  final int loop;

  const CustomShimmer({
    Key? key,
    required this.child,
    required this.gradient,
    this.direction = ShimmerDirection.ltr,
    this.period = const Duration(milliseconds: 1500),
    this.loop = 0,
  }) : super(key: key);

  CustomShimmer.fromColors(
      {Key? key,
      required this.child,
      required Color baseColor,
      required Color highlightColor,
      this.period = const Duration(milliseconds: 1500),
      this.direction = ShimmerDirection.ltr,
      this.loop = 0})
      : gradient = LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              baseColor,
              baseColor,
              highlightColor,
              baseColor,
              baseColor
            ],
            stops: [
              0.0,
              0.35,
              0.5,
              0.65,
              1.0
            ]),
        super(key: key);

  @override
  _CustomShimmerState createState() => _CustomShimmerState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(new DiagnosticsProperty<Gradient>('gradient', gradient,
        defaultValue: null));
    properties.add(new EnumProperty<ShimmerDirection>('direction', direction));
    properties.add(new DiagnosticsProperty<Duration>('period', period,
        defaultValue: null));
  }
}

class _CustomShimmerState extends State<CustomShimmer>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  int? _count;

  @override
  void initState() {
    super.initState();
    _count = 0;
    _controller = AnimationController(vsync: this, duration: widget.period)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _count = _count! + 1;
          if (widget.loop <= 0) {
            _controller!.repeat();
          } else if (_count! < widget.loop) {
            _controller!.forward(from: 0.0);
          }
        }
      })
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    return _Shimmer(
      child: widget.child,
      direction: widget.direction,
      gradient: widget.gradient,
      percent: _controller!.value,
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
}

class _Shimmer extends SingleChildRenderObjectWidget {
  final double percent;
  final ShimmerDirection direction;
  final Gradient gradient;

  _Shimmer(
      {Widget? child,
      required this.percent,
      required this.direction,
      required this.gradient})
      : super(child: child);

  @override
  _ShimmerFilter createRenderObject(BuildContext context) {
    return _ShimmerFilter(percent, direction, gradient);
  }

  @override
  void updateRenderObject(BuildContext context, _ShimmerFilter shimmer) {
    shimmer.percent = percent;
  }
}

class _ShimmerFilter extends RenderProxyBox {
  final _clearPaint = Paint();
  final Paint _gradientPaint;
  final Gradient _gradient;
  final ShimmerDirection _direction;
  double? _percent;
  Rect? _rect;

  _ShimmerFilter(this._percent, this._direction, this._gradient)
      : _gradientPaint = Paint()..blendMode = BlendMode.srcIn;

  @override
  bool get alwaysNeedsCompositing => child != null;

  set percent(double newValue) {
    if (newValue != _percent) {
      _percent = newValue;
      markNeedsPaint();
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null) {
      assert(needsCompositing);

      final width = child!.size.width;
      final height = child!.size.height;
      Rect? rect;
      double dx, dy;
      if (_direction == ShimmerDirection.rtl) {
        dx = _offset(width, -width, _percent ?? 0);
        dy = 0.0;
        rect = Rect.fromLTWH(offset.dx - width, offset.dy, 3 * width, height);
      } else if (_direction == ShimmerDirection.ttb) {
        dx = 0.0;
        dy = _offset(-height, height, _percent ?? 0);
        rect = Rect.fromLTWH(offset.dx, offset.dy - height, width, 3 * height);
      } else if (_direction == ShimmerDirection.btt) {
        dx = 0.0;
        dy = _offset(height, -height, _percent ?? 0);
        rect = Rect.fromLTWH(offset.dx, offset.dy - height, width, 3 * height);
      } else {
        dx = _offset(-width, width, _percent ?? 0);
        dy = 0.0;
        rect = Rect.fromLTWH(offset.dx - width, offset.dy, 3 * width, height);
      }
      if (_rect != rect) {
        _gradientPaint.shader = _gradient.createShader(rect);
        _rect = rect;
      }

      context.canvas.saveLayer(offset & child!.size, _clearPaint);
      context.paintChild(child!, offset);
      context.canvas.translate(dx, dy);
      context.canvas.drawRect(rect, _gradientPaint);
      context.canvas.restore();
    }
  }

  double _offset(double start, double end, double percent) {
    return start + (end - start) * percent;
  }
}
