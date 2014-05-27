#converts a bunch of pictures into one large pdf deleting intermediate files. caution: nothing should be in the directory except those

for f in *.jpg; do
    convert ./${f%.jpg} ./${f}.pdf
done
rm *.jpg
pdfjoin *.pdf
find . ! -name *joined.pdf ! -name *.sh | xargs rm
