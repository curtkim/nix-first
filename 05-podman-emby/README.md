podman run \
    --name embyserver \
    --net=host \ # Enable DLNA and Wake-on-Lan
    --device /dev/dri:/dev/dri \ # VAAPI/NVDEC/NVENC render nodes
    --device nvidia.com/gpu=all --security-opt=label=disable \
    --publish 8096:8096 \ # HTTP port
    --publish 8920:8920 \ # HTTPS port
    --restart on-failure \ # Auto-start on boot, and restart on failure
    emby/embyserver:4.8.0.57

    #--volume /path/to/share2:/mnt/share2 \ # Media directory
