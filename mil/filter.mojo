from algorithm import vectorize


@always_inline("nodebug")
fn quantize(image: Image, scale: Int):
    @parameter
    fn vec_quantize[nelts: Int](i: Int):
        var data = image.data.load[nelts](i)
        image.data.store[nelts](i, (data >> scale) * (1 << scale))

    vectorize[vec_quantize, simdwidthof[DType.uint8]()](image.shape.size())
