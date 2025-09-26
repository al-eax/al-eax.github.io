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
    image: "/en/posts/2025-09-26/py-django-tests.png" # image path/url
    relative: false
---



I’ve been working with Django for a while, and one thing that always slows me down is running tests.

By default, you can either run all tests or specify a specific test case. That’s fine, but sometimes I just want to run the tests in the file I’m currently editing - nothing more. So I set up a small workflow in VS Code to do exactly that.

## Running tests of a single module

Normally, you’d run Django tests of a single module like this:

```sh
python manage.py test myapp.tests.MyTestCase
```

This works, but it’s a bit annoying to type the full module path every time — especially when you just want to test the file you’re working on.

## Rnning tests of a single file

I wrote a tiny helper script that figures out the correct module path from the file you give it and runs the tests just for that file:

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

Now I can just do this:

```sh
python run_current_test.py myapp/tests/test_example.py
```

## VS Code Integration

Of course, I didn’t want to run that command manually every time. So here’s the neat part:
I created a new debug configuration `.vscode/launch.json` file in my project (if you don’t have one, just create it).

I added this configuration:

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

Now when I hit F5 in VS Code, it automatically runs the tests for the file I’m currently editing - and since it’s using the VS Code debugger, I can also set breakpoints and step through my test code.

This setup makes my workflow so much faster:

- I can focus on just the tests I’m working on
- I don’t waste time running the entire test suite
- I can debug interactively without any extra setup

Small trick, big time-saver.

