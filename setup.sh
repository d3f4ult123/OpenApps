#!/bin/bash

# 1. System aktualisieren und Abhängigkeiten installieren
sudo apt update
sudo apt install -y git gnome-tweaks gnome-shell-extensions

# 2. Verzeichnisse erstellen
mkdir -p ~/.themes
mkdir -p ~/.icons

# 3. MacTahoe GTK Theme (Dunkelblau) installieren
echo "Lade MacTahoe GTK Theme herunter..."
git clone https://github.com/vinceliuice/MacTahoe-gtk-theme.git --depth=1
cd MacTahoe-gtk-theme
# Installation mit Fokus auf Dunkelblau (-c dark -v blue)
./install.sh -t all -c dark -v blue
cd ..

# 4. MacTahoe Icons installieren
echo "Lade MacTahoe Icons herunter..."
git clone https://github.com/vinceliuice/MacTahoe-icon-theme.git --depth=1
cd MacTahoe-icon-theme
./install.sh
cd ..

# 5. Einstellungen anwenden
echo "Wende dunkelblaues Design an..."
gsettings set org.gnome.desktop.interface gtk-theme "MacTahoe-Blue-Dark"
gsettings set org.gnome.desktop.interface icon-theme "MacTahoe-dark"
gsettings set org.gnome.desktop.wm.preferences theme "MacTahoe-Blue-Dark"

# 6. Dock-Anpassung (Dateien App an erster Stelle)
# Hinweis: Das setzt die Standard-Favoriten neu. 
# 'org.gnome.nautilus.desktop' ist die Dateien-App.
gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'firefox.desktop', 'thunderbird.desktop', 'org.gnome.Terminal.desktop']"

echo "Fertig! Bitte starte die 'Tweaks' (Optimierungen) App, um das Shell-Theme manuell auf MacTahoe-Blue-Dark zu stellen."
