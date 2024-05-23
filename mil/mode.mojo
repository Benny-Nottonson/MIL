@register_passable("trivial")
struct ImageMode:
    var mode: Int8

    alias GRAY = Self(0)
    alias RGB = Self(1)
    alias RGBA = Self(2)
    alias CMYK = Self(3)
    alias YCbCr = Self(4)
    alias LAB = Self(5)
    alias HSV = Self(6)
    
    alias MODES = VariadicList(
        Self.GRAY,
        Self.RGB,
        Self.RGBA,
        Self.CMYK,
        Self.YCbCr,
        Self.LAB,
        Self.HSV,
    )

    @always_inline("nodebug")
    fn __init__(inout self, mode: Int):
        self.mode = mode

    @always_inline("nodebug")
    fn __eq__(self, other: Self) -> Bool:
        return self.mode == other.mode

    @always_inline("nodebug")
    fn __str__(self) -> String:
        if self == Self.GRAY:
            return "L"
        if self == Self.RGB:
            return "RGB"
        if self == Self.RGBA:
            return "RGBA"
        if self == Self.CMYK:
            return "CMYK"
        if self == Self.YCbCr:
            return "YCbCr"
        if self == Self.LAB:
            return "LAB"
        if self == Self.HSV:
            return "HSV"
        return "Unknown"

    @staticmethod
    @always_inline("nodebug")
    fn from_pil(pil_mode: String) -> Self:
        for mode in Self.MODES:
            if str(mode) == pil_mode:
                return mode
        return Self.RGB
