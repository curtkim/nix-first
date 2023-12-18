## howto

    sudo virt-install --name=nixos \
    --memory=8196 \
    --vcpus=2 \
    --disk /tmp/my-nixos-disk-image2.qcow2,device=disk,bus=virtio,size=16 \
    --cdrom=/data/Downloads/nixos-minimal-23.05.4172.bd1cde45c778-x86_64-linux.iso \
    --os-type=generic  \
    --boot=uefi \
    --nographics \
    --console pty,target_type=virtio

    qemu-img create -f qcow2 nixos.img 25G
    qemu-system-x86_64 -enable-kvm -m 8192 -boot d -cdrom /data/Downloads/nixos-minimal-23.05.4172.bd1cde45c778-x86_64-linux.iso -hda nixos.img

    sudo virt-install --name ubuntu-guest \
    --os-variant ubuntu20.04 --vcpus 2 --ram 2048 \
    --location http://ftp.ubuntu.com/ubuntu/dists/focal/main/installer-amd64/ \
    --network bridge=virbr0,model=virtio \
    --graphics none \
    --extra-args='console=ttyS0,115200n8 serial'
