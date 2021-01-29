from os import walk, mkdir
from PIL import Image, UnidentifiedImageError

direction = 'column'
path = './png_output'
if path[:1] != '/' :
    path += '/'

_, _, filenames = next(walk(path))

print()



list = []
print('Starting process :')
for filename in filenames :
    print("--> Found file '" + filename + "' :")
    if filename[-4:] == '.png' :
        print("--> '" + filename + "' is a '.png' file, continue :")

        try:
            image = Image.open(path + filename)
            print("--> '" + filename[:-4] + ".png' opened.")

            list.append({'image' : image, 'name' : filename, 'width' : image.size[0], 'height' : image.size[1]})
            pass
        except UnidentifiedImageError :
            print("--> '" + filename[:-4] + ".png' can't be opened, abort.")
            pass
        pass
    else :
        print("-->'" + filename + "' is not a '.png' file, abort.")
        pass
    print()
    pass

list = sorted(list, key = lambda i: i['name'])


width, height = list[0]['image'].size


sprite_sheet = Image.new('RGBA', (width, len(list) * height), (255, 0, 0, 0))
for i in range(len(list)):
    sprite_sheet.paste(list[i]['image'], (0, height * i))
    pass

sprite_sheet.save('final_output.png')
print("'final_output.png' has been created.")
