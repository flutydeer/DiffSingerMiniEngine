# Activate virtual environment
& ./venv/Scripts/Activate.ps1

# Run PyInstaller
pyinstaller --onedir server.py --noconfirm

# Copy configs to dist
Copy-Item -Path .\configs -Destination .\dist\server -Recurse -Force

# Copy assets to dist
Copy-Item -Path .\assets\acoustic -Destination .\dist\server\assets -Recurse -Force
Copy-Item -Path .\assets\dictionaries -Destination .\dist\server\assets -Recurse -Force
Copy-Item -Path .\assets\rhythmizer .\dist\server\assets -Recurse -Force
Copy-Item -Path .\assets\vocoder .\dist\server\assets -Recurse -Force

# Compress files
Compress-Archive -Path .\dist\server -DestinationPath .\dist\diffsinger-server-windows.zip -Force