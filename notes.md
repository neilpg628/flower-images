I've tested image generation and network training across a range of GPU types and configurations. It is important to log these

1 GPU
|   | RTX 2080 | GTX 1080TI | Titan RTX |
|---|---|---|---|
| Fullsize (8189 Images) | Out of Memory | Out of Memory | Ongoing |
| Partial (1000 Images) | Not Tested | Not Tested | Not Tested |

2 GPU's
|   | RTX 2080 | GTX 1080TI | Titan RTX |
|---|---|---|---|
| Fullsize (8189 Images) | Out of Memory | Not Allocatable | Not Allocatable |
| Partial (1000 Images) |   | Not Allocatable | Not Allocatable |


Also, I've taken a look at the stylegan2 repo with additions [here](https://github.com/dvschultz/stylegan2). This one allows for quick generation of gifs through latent space which allow images to morph. I was unable to run this because the .pkl files seem to have moved (running `curl car_model --output=cars.pkl` with the proper url simply outputs an html page stating that the file has moved. My guess is it is now account protected. However, in theory I should be able to run 
```
python run_generator.py generate-latent-walk --network=cars.pkl --seeds=1-10 --frames 200 --truncation-psi=1.0
ffmpeg -r 24 -i ./results/generated-images/frame%05d.png -vcodec libx264 -pix_fmt yuv420p latent-walk.mp4
```

to produce a mp4 video file through the latent space of images.


Edit -- See the procedure. Since the repo was made, the models were moved to a NVIDIA host.
