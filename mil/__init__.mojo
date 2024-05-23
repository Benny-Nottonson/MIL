from .data import ImageData
from .mode import ImageMode
from .shape import ImageShape

from .loader import from_url, save_image


@register_passable("trivial")
struct Image:
    var shape: ImageShape
    var mode: ImageMode
    var data: ImageData

    fn __init__(inout self, shape: ImageShape, *, mode: ImageMode = ImageMode.RGB):
        self.shape = shape
        self.mode = mode
        self.data = ImageData(shape)

    fn save(self):
        save_image(self)

    @staticmethod
    fn from_url(url: String) -> Self:
        return from_url(url)