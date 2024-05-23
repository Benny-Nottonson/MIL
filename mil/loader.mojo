from python import PythonObject, Python
from testing import assert_true

fn from_url(url: String) -> Image:
    try:
        var requests = Python.import_module("requests")
        var pil = Python.import_module("PIL.Image")

        var img = pil.open(requests.get(url, stream = True).raw)
        var data = img.getdata()

        var shape = ImageShape(int(img.size[0]), int(img.size[1]), len(img.getbands()))
        var mode = ImageMode.from_pil(img.mode)
        
        assert_true(len(data) == shape.pixels(), "Image size mismatch")
        assert_true(str(mode) != "Unknown", "Unknown image format: " + str(img.mode))

        var result = Image(shape, mode = mode)
        
        for i in range(shape.pixels()):
            for j in range(shape.channels()):
                result.data[i * shape.channels() + j] = int(data[i][j])

        return result
    except e:
        print("Error loading Image: ", e)
    
    return Image(-1)

fn save_image(img: Image, path: String = "result.png"):
    try:
        var pil = Python.import_module("PIL.Image")
        var np = Python.import_module("numpy")

        var result = np.zeros((img.shape.height(), img.shape.width(), img.shape.channels()), dtype=np.uint8)

        for i in range(img.shape.height()):
            for j in range(img.shape.width()):
                for k in range(img.shape.channels()):
                    result[i][j][k] = img.data.data[(i * img.shape.width() + j) * img.shape.channels() + k]

        pil.fromarray(result, mode = str(img.mode)).save(path)
    except e:
        print("Error saving Image: ", e)
