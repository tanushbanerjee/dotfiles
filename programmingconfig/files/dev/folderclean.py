import os

def createNotExists(folder):
    if not os.path.exists(folder):
        os.makedirs(folder)

def move(folderName, files):
    os.replace(file, f"{folderName}/{file}")


files = os.listdir()
files.remove('folderclean.py')

createNotExists('Images')
createNotExists('Docs')
createNotExists('Media')
createNotExists('Other')

imgExts = [".png", ".img", ".jpg", ".jpeg", ".ico"]
docsExts = [".txt", ".docx", ".doc", ".pdf", ".odt"]
mediaExts = [".mp4", ".mp3", ".mkv", ".flv"]


for file in files:
    ext = os.path.splitext(file)[1].lower()
    if ext in imgExts:
        move("Images", file)
    elif ext in docsExts:
        move('Docs', file)
    elif ext in mediaExts:
        move('Media', file)
    elif (ext not in imgExts) and (ext not in docsExts) and (ext not in mediaExts) and (os.path.isfile(file)):
        move('Other', file)

print("Successfully arranged all the files in respected folders")

