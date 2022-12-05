if [ -f ~/rom/out/target/product/juice/obj/KERNEL_OBJ/arch/arm64/boot/Image.gz-dtb ]; then
	rclone copy ~/rom/out/target/product/juice/obj/KERNEL_OBJ/arch/arm64/boot/Image.gz-dtb venyx:juice -P
fi

if [ -f ~/rom/out/target/product/juice/obj/KERNEL_OBJ/arch/arm64/boot/dtbo.img ]; then
	rclone copy ~/rom/out/target/product/juice/obj/KERNEL_OBJ/arch/arm64/boot/dtbo.img venyx:juice -P
fi

if [ -f ~/rom/out/target/product/juice/Havoc*.zip ]; then
	curl -s https://api.telegram.org/$tokentl/sendMessage -d chat_id=$idtl -d text="Uploading Build $(cd ~/rom/out/target/product/juice/ && ls Havoc*.zip)"
	rclone copy ~/rom/out/target/product/juice/Havoc*.zip venyx:juice -P
	curl -s https://api.telegram.org/$tokentl/sendMessage -d chat_id=$idtl -d text="Build $(cd ~/rom/out/target/product/juice/ && ls Havoc*.zip) Uploaded Successfully!"
fi
