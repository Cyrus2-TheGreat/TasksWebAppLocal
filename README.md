# TasksWebAppLocal
Simple HTML application served locally, which works like a notepad accessible via a browser. Ideal for keeping tasks and ideas organized quickly, offline and without relying on external services.

## Turning a Local Web App into a Menu Shortcut (Linux)

This guide explains how to make a local web project accessible from your system’s app menu — just like a native application. It’s perfect for projects served with `python3 -m http.server`.

---

### Requirements

- A local web project (with an `index.html` or `task.html`)
- A startup script (e.g., `open_task.sh`)
- A `.png` icon file for the app (optional, but recommended)

---

### Example Project Structure

```plaintext
HTML_APP/
└── task_app/
    ├── task.html
    ├── open_task.sh
    ├── task.html.desktop
    └── taskicon.png
```

---

### 1. Create a Startup Script

Create a file named `open_task.sh` with the following content:

```bash
#!/bin/bash
cd /home/your-username/Documents/HTML_APP/task_app/
sleep 1
xdg-open http://localhost:8000/task.html
python3 -m http.server
```

- This script:
  - Changes to the project directory
  - Opens the web page in your default browser
  - Starts a simple local HTTP server
- Make it executable:
  ```bash
  chmod +x open_task.sh
  ```

---

### 2. Create the `.desktop` Launcher

Create a file named `task.html.desktop` with the following content:

```ini
[Desktop Entry]
Version=1.0
Type=Application
Name=Tasks
Comment=Application to take notes
Exec=/home/your-username/Documents/HTML_APP/task_app/open_task.sh
Icon=/home/your-username/Documents/HTML_APP/task_app/taskicon.png
Terminal=true
Categories=Utility;
```

- `Type=Application` is **required** for it to show up in the app menu.
- `Exec` is the path to your startup script.
- `Icon` points to your custom icon.
- `Terminal=true` is needed because the script runs a foreground server.
- Make the launcher executable:
  ```bash
  chmod +x task.html.desktop
  ```

---

### 3. Add It to the System App Menu

Copy the `.desktop` file to your local applications directory:

```bash
cp task.html.desktop ~/.local/share/applications/
```

Now, the app will appear in your system’s application launcher. You can search for it by the name set in the `.desktop` file (`Name=Tasks`).

---

### 4. Launch It

- Press your system’s **Super key** (or open the app menu)
- Search for **Tasks**
- Click to launch — your app opens in the browser automatically 🎉

---

### Extras

- `xdg-open` ensures your browser opens using the default settings.
- To avoid showing the terminal, you could run the server in the background and redirect output, but that may make it harder to stop the process cleanly.
