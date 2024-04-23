Think twice before giving a value to collectionViewCell's width and height.
eg. cell > stackView > image > stackView > ... 
collectionviewCell was returning layout errors when I gave a value of 117.
Every component nested within the collectionViewCell also returned an error.