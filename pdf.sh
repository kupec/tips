# create pdf from images
convert *.jpg -scale 50% out.pdf
# create pdf from images and decrease size
convert *.jpg -scale 50% out.pdf
# create pdf from images and decrease size to specific
convert *.jpg -resize 2000x2000 out.pdf

# transform pdf to a4 (keep images but change viewport to a4 for all pages)
pdfjam --paper a4paper --outfile out.pdf in.pdf
