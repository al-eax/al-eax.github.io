---
date: '{{ .Date }}'
draft: true
title: '{{ replace .File.ContentBaseName "-" " " | title }}'
tags: ["random"]
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
    image: '/en/{{ replace .File.Dir "\\" "/" }}cover.png'
    default: '/en/200x50.svg'
    relative: false
---
