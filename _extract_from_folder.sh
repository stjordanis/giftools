#Drag and drop the Folders generated by DAIN to extract the Gifs from them
#Change the "for file in *limitPallete*.gif;" to change which files you want to extract
#Change the "cd output_videos" go look in other folders
#Change the "cp $file ../../"$FILENAME"_dain.gif" line to change the output filename
#echo Arguments: ["$@"]\n
for FOLDER in "$@";
do
    FOLDER2=$(cygpath "$FOLDER" -u -a)
    FILENAME=$(basename -- "$FOLDER2")
    echo Extracting from $FOLDER2
    cd "$FOLDER2"
    cd output_videos
    for file in *limitPallete*.gif;
    do
        OUTPUTNAME="$FILENAME"_dain.gif
        echo Creating $OUTPUTNAME
        cp $file ../../"$OUTPUTNAME"
    done
done
echo Done
exec $SHELL