THISFILE=`basename "$0"`
PYSCRIPTPATH="${0%\\*}\\change_background.py" #if the .sh script is somewhere else, put the absolute path instead
#cd "${0%\\*}"
echo ALL : $@
PARAM_FOLDER=$(dirname -- "$1")
#PARAM_FOLDER="${1%\\*}" #The python script will be local to the image (for creating new ones)
cd "$PARAM_FOLDER"
(
#bash "${0%\\*}\\_unoptimize_gif.sh" "$@"
echo python "$PYSCRIPTPATH" "$@" --fill
python "$PYSCRIPTPATH" "$@" --fill
)
|| exec $SHELL