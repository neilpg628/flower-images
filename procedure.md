# Generating Images

To start this process, we need to clone the stylegan2-ada repo at https://github.com/NVlabs/stylegan2-ada. This contains all of the scripts for training new models and using existing ones.
To generate images from existing models, we can use the .pkl models provided at https://nvlabs-fi-cdn.nvidia.com/stylegan2-ada/pretrained/. Simply run

`python3 generate.py --outdir=out --trunc=1 --seeds=a-b --network=model`

where 'trunc=1' makes sure that the generated images aren't truncated in any way. The seeds can either be a single range or a comma separated list, and represent starting points for the image generating process. The model should be the url of the required .pkl file.

For instance, to generate 20 random images of dogs in the outdog directory, run

`python3 generate.py --outdir=outdog --trunc=1 --seeds=1-20 --network=https://nvlabs-fi-cdn.nvidia.com/stylegan2-ada/pretrained/afhqdog.pkl`

For image generation it would be helpful to have a GPU with at least 11GB of RAM. I used a NVIDIA Titan RTX for this, though other methods could certainly work. The script `generate.sh` submitted as an sbatch job will create 11 images for each of 6 models (dogs, cats, wild animals, people, paintings and CIFAR) with seeds from 500-510 and should be pretty fast on a single Titan.

To actually train a model, we need far more resources and at least a couple of days with a single GPU to get proper convergence. NVIDIA makes it pretty easy to make you own datasets given a large collection of images. There are a large number of good databases for computer vision collated [here](http://homepages.inf.ed.ac.uk/rbf/CVonline/Imagedbase.htm#biomed) and they contain everything from images of flowers to videos of people making crepes. I personally used the dataset of 8189 flowers [here](http://www.robots.ox.ac.uk/~vgg/data/flowers/102/index.html).

First, it is necessary to crop these images to squares with side length a power of 2. This can be done with `mogrify` on Linux. Once in the directory with the flower images, running 

`mogrify -verbose -type truecolor -format jpg -thumbnail 512x512^ -gravity center -extent 512x512 *` 

This will crop and center every image in a 512x512 pixel region. `-type truecolor` tells it to preserve colors, and `-thumbnail` and `-extent` specify the minimum and maximum size. (The resolution with the caret is the min size 512x512).

Then our directory will contain properly sized images.

To actually make the dataset, we need to convert these images into TFRecords format. Luckily NVIDIA makes this simple too, with the script `dataset_tool.py`. Running `python3 dataset_tool.pycreate_from_images ./datasets/custom ./custom-images where custom-images` is you image directory will (over several minutes) convert the images in `./custom-images` to a TFRecord dataset in `./datasets/custom-images`. This should also probably be done on a GPU if possible.

Now to actually train our model, which is a time intensive step that can take a few days on a single GPU. See the attached image for runtimes for a range of image sizes.

To train the network on a single Titan GPU with 32G of CPU RAM we can use the attached sbatch script which runs the command 

`python3 train.py --outdir=./training-runs --gpus=1 --data=./datasets/flowers --mirror=1 --metrics=None --cfg=auto`

This script does work. Refer to flowerjobtitan.log for the details. There are plenty of options that can be passed to this script, and to see all of them run `python3 train.py -h`. Our setup will train the model for 25000 kimg, which is a very long time (approx 40 days on the single Titan GPU). However, models are snapshotted every 50 kimg so that at any time we can stop the process and use existing models. The model trained for 5 days before it was stopped.

The .pkl files in training-runs are snapshots of our model, and they can be used to generate images using `generate.py`! Thus with StyleGAN2 we are able to generate images of any type by following these steps. Our .pkl model for flowers can be used to generate more flowers. The model is [here](https://drive.google.com/file/d/1mHoo3ud5SUt7GmJdm4EB0H3DqO4zi1Qp/view?usp=sharing). Try running it youself!

# Generating Gifs

The images created by StyleGAN exist in a latent space that can be traversed like any other space. We can also try 'walking' through this space to produce a sequence of very similar images that slowly transform from one to another. We can do this using the scripts in this [fork](https://github.com/dvschultz/stylegan2) of the main StyleGAN2 repository. First clone it, and then take note of the script `run_generator.py`. Passing arguments like so

```
python3 run_generator.py generate-latent-walk --network=./networks/stylegan2-ffhq-config-f.pkl --truncation-psi=0.7 --seeds=48295,83843,28494,54683,78382,83927,52345,78372,12783,97873 --frames 250
ffmpeg -pattern_type glob -i '*.png' humans.mp4
```

will actually generate a walk through the latent space of images of people, given a model stored in `./networks`. `ffmpeg` is a standard command-line video software package that will string together the 250 still frames in `./results`. In this case we have used a pretrained network that can be found [here](https://nvlabs-fi-cdn.nvidia.com/stylegan2/networks/stylegan2-ffhq-config-f.pkl) and downloaded with `curl`. The video from this run is availbile [here](https://youtu.be/6_srYUcTX6g). Running this on other models can produce similar walks through the space of 

* [Cars](https://youtu.be/KRlBJYKeLgI)
* [Cats](https://youtu.be/g3ex_i6e1Sg)
* [Churches](https://youtu.be/X_Ds6MZbTPo)
* [Horses](https://youtu.be/jz84aYEAcyE)
* [People](https://youtu.be/6_srYUcTX6g)
