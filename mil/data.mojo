@register_passable("trivial")
struct ImageData:
    var data: DTypePointer[DType.uint8]

    @always_inline("nodebug")
    fn __init__(inout self, shape: ImageShape):
        self.data = DTypePointer[DType.uint8].alloc(shape.size())

    @always_inline("nodebug")
    fn __setitem__(inout self, idx: Int, value: Int):
        self.data[idx] = value