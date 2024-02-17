IMAGE_NAME="thepapablack/black_gen_ai_base:full"
CONTAINER_NAME="black_gen_ai_base_full"

DETACHED=false

while getopts "d:" opt; do
  case ${opt} in d ) DETACHED=true ;; \? ) ;;
  esac
done

CMD="docker run -v $1:/workspace --name $CONTAINER_NAME $IMAGE_NAME"

if [[ DETACHED ]]; then
    bash -c "$CMD -d"
else
    bash -c "$CMD"
fi
