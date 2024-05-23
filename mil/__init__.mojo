from .data import ImageData
from .mode import ImageMode
from .shape import ImageShape

import .loader
import .filter


@register_passable("trivial")
struct Image:
    var shape: ImageShape
    var mode: ImageMode
    var data: ImageData

    @always_inline("nodebug")
    fn __init__(inout self, shape: ImageShape, *, mode: ImageMode = ImageMode.RGB):
        self.shape = shape
        self.mode = mode
        self.data = ImageData(shape)

    @always_inline("nodebug")
    fn quantize(inout self, scale: Int):
        filter.quantize(self, scale)

    @always_inline("nodebug")
    fn save(self):
        loader.save_image(self)

    @staticmethod
    @always_inline("nodebug")
    fn from_url(url: String) -> Self:
        return loader.from_url(url)