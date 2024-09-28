.PHONY: flatpak
flatpak:
	flatpak-builder --user --install-deps-from=flathub --force-clean build-dir com.sourceaudio.Neuro.yaml

.PHONY: install
install:
	flatpak-builder --user --install --install-deps-from=flathub --force-clean build-dir com.sourceaudio.Neuro.yaml
	sudo cp conf/udev/99-sourceaudio.rules /etc/udev/rules.d/
	sudo udevadm control --reload-rules
	sudo udevadm trigger

.PHONY: run
run: install
	flatpak run com.sourceaudio.Neuro
