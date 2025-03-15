rm -rf temp
mkdir -p temp

PPI=${1:-300}
A4_WIDTH=210
A4_HEIGHT=297

let "IMAGE_WIDTH=PPI*A4_WIDTH*10/254"
let "IMAGE_HEIGHT=PPI*A4_HEIGHT*10/254"

for IMG in *.jpg; do
    convert $IMG \
        -auto-orient \
        -resize "${IMAGE_WIDTH}x${IMAGE_HEIGHT}>" \
        -gravity center \
        -extent "${IMAGE_WIDTH}x${IMAGE_HEIGHT}" \
        temp/$IMG.pdf
done;

gs \
    -sDEVICE=pdfwrite \
    -sPAPERSIZE=a4 \
    -dFitPage \
    -o out.pdf \
    temp/*.pdf
