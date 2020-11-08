I've tested image generation and network training across a range of GPU types and configurations. It is important to log these

1 GPU
|   | RTX 2080 | GTX 1080TI | Titan RTX |
|---|---|---|---|
| Fullsize (8189 Images) | Out of Memory | Out of Memory | Ongoing |
| Partial (1000 Images) |   |   |   |

2 GPU's
|   | RTX 2080 | GTX 1080TI | Titan RTX |
|---|---|---|---|
| Fullsize (8189 Images) | Out of Memory | Not Allocatable | Not Allocatable |
| Partial (1000 Images) |   | Not Allocatable | Not Allocatable |
