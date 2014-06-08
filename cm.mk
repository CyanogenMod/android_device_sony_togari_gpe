# Inherit CM common Phone stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

$(call inherit-product, device/sony/togari_gpe/full_togari_gpe.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=C6806_GPe BUILD_FINGERPRINT=Sony/C6806_GPe/C6806:4.4.3/KTU84L.S1/3056:user/release-keys PRIVATE_BUILD_DESC="C6806-user 4.4.3 KTU84L.S1 3056 test-keys"

PRODUCT_NAME := cm_togari_gpe
PRODUCT_DEVICE := togari_gpe
