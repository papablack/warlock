source ./setenv.sh


install_service() {
    if [ -z "$1" ]; then
        echo "Error: No service name provided."
        return 1  # Exit the function with an error status
    fi

    SERVICE_NAME="${1}.service"
    SERVICE_CMD=${2}
    SERVICE_STOP_CMD=${3}
    
    # Check if the service already exists
    if systemctl --all --type service | grep -q "$SERVICE_NAME"; then
        echo "Service $SERVICE_NAME already exists."
    else
        # Create the service file
        # Copy the sample file and replace the placeholders
        sed -e "s/__SERVICE_NAME__/$SERVICE_NAME/g" \
            -e "s|__SERVICE_CMD__|$SERVICE_CMD|g" \
            -e "s|__SERVICE_STOP__|$__SERVICE_STOP__|g" \            
            $SCRIPTS_DIR/_sample_service.sh > /etc/systemd/system/$SERVICE_NAME.service
    fi
}


install_service "jupyter-lab" "jupyter-lab" "pkill -f jupyter-lab"