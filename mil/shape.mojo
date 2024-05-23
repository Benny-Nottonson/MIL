@register_passable("trivial")
struct ImageShape:
    var shape: StaticIntTuple[3]

    @always_inline("nodebug")
    fn __init__(inout self, data: StaticIntTuple[3]):
        self.shape = data

    @always_inline("nodebug")
    fn __init__(inout self, *data: Int):
        self.shape = data

    @always_inline("nodebug")
    fn __str__(self) -> String:
        var val: String = "("
        val += self.width()
        val += ", "
        val += self.height()
        val += ") x "
        val += self.channels()
        return val

    @always_inline("nodebug")
    fn width(self) -> Int:
        return self.shape[0]

    @always_inline("nodebug")
    fn height(self) -> Int:
        return self.shape[1]

    @always_inline("nodebug")
    fn channels(self) -> Int:
        return self.shape[2]

    @always_inline("nodebug")
    fn pixels(self) -> Int:
        return self.width() * self.height()

    @always_inline("nodebug")
    fn size(self) -> Int:
        return self.width() * self.height() * self.channels()