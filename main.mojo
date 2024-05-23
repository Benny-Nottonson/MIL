from mil import Image

fn main():
    var img = Image.from_url("https://static.vecteezy.com/system/resources/thumbnails/006/720/668/small_2x/dog-face-logo-free-vector.jpg")
    img.save()