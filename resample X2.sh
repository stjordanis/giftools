THISFILE=`basename "$0"`
ZOOM_AMOUNT="${THISFILE//[!0-9]/}" #based on script file name
PYSCRIPTPATH="${0%\\*}\\scale_image.py" #if the .sh script is somewhere else, put the absolute path instead
#echo "$0 ${THISFILE} ${THISFILE//[!0-9]/} ${1%\\*}"
#cd "${0%\\*}"
PARAM_FOLDER=$(dirname -- "$1")
#PARAM_FOLDER="${1%\\*}" #The python script will be local to the image (for creating new ones)
cd "$PARAM_FOLDER"
((
for FILE in "$@"
do
    FULLNAME=$(basename -- "$FILE")
    NAME="${FULLNAME%.*}"
    EXTENSION="${FULLNAME##*.}"
    echo "Creating ${NAME}_X${ZOOM_AMOUNT}.${EXTENSION}"
    python "$PYSCRIPTPATH" "$ZOOM_AMOUNT" "$FULLNAME"
    #gifsicle -O3 "${OUTFILE}" -o "${OUTFILE}"
done
)# && read  -n 1 -p "Done. Press enter." mainmenuinput 
#for FILE in "$OUTFILES"
#do
#echo "File" "$FILE" "$THISFILE"
#done
) || exec $SHELL