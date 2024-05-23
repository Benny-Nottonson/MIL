@register_passable("trivial")
struct ImageData:
    var data: DTypePointer[DType.uint8]

    @always_inline("nodebug")
    fn __init__(inout self, shape: ImageShape):
        self.data = DTypePointer[DType.uint8].alloc(shape.size())

    @always_inline("nodebug")
    fn __setitem__(inout self, idx: Int, value: Int):
        self.data[idx] = value

    @always_inline("nodebug")
    fn load[W: Int = 1](self, idx: Int) -> SIMD[DType.uint8, W]:
        return self.data.load[width=W](idx)

    @always_inline("nodebug")
    fn store[W: Int = 1](self, idx: Int, val: SIMD[DType.uint8, W]):
        return self.data.store[width=W](idx, val)