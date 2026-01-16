---
date: '2025-09-26T21:04:50+02:00'
draft: false
title: 'Visual Studio Code: Run Django Tests for the Current File'
tags: ["python", "django", "vscode"]
author: "alex"
showToc: false
TocOpen: false
hidemeta: false
comments: false
description: ""
disableShare: false
hideSummary: false
ShowReadingTime: true
ShowBreadCrumbs: true
ShowPostNavLinks: true
ShowWordCount: true
UseHugoToc: true
cover:
    image: "/en/posts/2025-09-26_vscode-dj-test-current-file/py-django-tests.png" # image path/url
    relative: false
---


Ich arbeite schon eine Weile mit Django, und eine Sache, die mich immer wieder ausbremst, ist das Ausführen von Tests.

Standardmäßig kann man entweder alle Tests ausführen oder einen bestimmten Testfall angeben. Das funktioniert, aber manchmal will ich einfach nur die Tests der Datei, an der ich gerade arbeite, ausführen – nicht mehr. Deshalb habe ich mir einen kleinen Workflow in VS Code eingerichtet, der genau das ermöglicht.

## Tests eines einzelnen Moduls ausführen

Normalerweise führt man Django-Tests eines einzelnen Moduls so aus:

```sh
python manage.py test myapp.tests.MyTestCase
```

Das funktioniert, ist aber auf Dauer etwas nervig, weil man jedes Mal den vollständigen Modulpfad eintippen muss – vor allem, wenn man einfach nur die Datei testen möchte, an der man gerade arbeitet.


## Tests einer einzelnen Datei ausführen

Ich habe ein kleines Skript geschrieben, das automatisch den richtigen Modulpfad aus der angegebenen Datei erstellt und die Tests nur für diese Datei ausführt:

```py
# run_current_test.py

import os
import sys
import subprocess

if len(sys.argv) < 2:
    print("Usage: python run_current_test.py <path_to_test_file.py>")
    sys.exit(1)

file_path = os.path.abspath(sys.argv[1])
project_root = os.path.abspath(os.path.join(os.path.dirname(__file__)))

rel_path = os.path.relpath(file_path, project_root)
module = rel_path.replace(os.sep, ".").removesuffix(".py")

try:
    subprocess.run(
        [sys.executable, "manage.py", "test", "--noinput", module], check=True
    )
except subprocess.CalledProcessError as e:
    print(f"Tests failed with exit code {e.returncode}")
    sys.exit(e.returncode)
```

Jetzt kann ich einfach Folgendes ausführen, um alle Tests einer Datei zu starten:

```sh
python run_current_test.py myapp/tests/test_example.py
```

## Integration in VS Code

Natürlich wollte ich den Befehl nicht jedes Mal manuell eingeben. Hier kommt der praktische Teil:

Ich habe eine neue Debug-Konfiguration in `.vscode/launch.json` erstellt (wenn du noch keine hast, einfach anlegen) und folgende Konfiguration hinzugefügt:

```py
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Django Test Current File",
            "type": "debugpy",
            "request": "launch",
            "program": "${workspaceFolder}/run_current_test.py",
            "args": [
                "${file}"
            ],
            "console": "integratedTerminal"
        }
    ]
}

```

Jetzt genügt es F5 in VS Code zu drücken, damit die Tests der Datei, an der ich gerade arbeite,automatisch ausgeführt werden.
Und das Beste: Da der VS Code-Debugger verwendet wird, kann ich auch Breakpoints setzen und Schritt für Schritt durch den Testcode gehen.

Vorteile dieses Workflows

- Ich kann mich auf genau die Tests konzentrieren, an denen ich gerade arbeite.
- Ich verschwende keine Zeit mit der kompletten Test-Suite.
- Interaktives Debuggen funktioniert ohne zusätzliche Einrichtung.

Kleiner Trick – großer Zeitgewinn.

