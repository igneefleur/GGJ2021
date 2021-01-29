from os import walk, mkdir
from PIL import Image, UnidentifiedImageError

name = 'mob_walk'
direction = 'line'
path = './assets/mob_walk'
if path[:1] != '/' :
    path += '/'

_, _, filenames = next(walk(path))

print()

list = []
print('Starting process :')
for filename in filenames :
    print("--> Found file '" + filename + "' :")
    if filename[-4:] == '.tif' :
        print("--> '" + filename + "' is a '.tif' file, continue :")

        try:
            image = Image.open(path + filename)
            print("--> '" + filename[:-4] + ".tif' opened.")

            list.append({'image' : image, 'name' : filename})
            pass
        except UnidentifiedImageError :
            print("--> '" + filename[:-4] + ".tif' can't be opened, abort.")
            pass
        pass
    else :
        print("-->'" + filename + "' is not a '.tif' file, abort.")
        pass
    print()
    pass

list = sorted(list, key = lambda i: i['name'])

width, height = list[0]['image'].size

sprite_sheet = Image.new('RGBA', (width * len(list), height), (255, 0, 0, 0))
for i in range(len(list)):
    sprite_sheet.paste(list[i]['image'], (width * i, 0))
    pass

sprite_sheet.save('png_output/' + name +'.png')
print("'sprite_sheet.png' has been created.")
