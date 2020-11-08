# flower-images
Uses NVIDIA's StyleGAN-ADA Network to generate images of flowers. 

The point of this project is to understand the architecture of NVIDIA Labs' network and how StyleGAN has been used to generate vast quantities of images of all kinds. The most famous example is probably the website [ThisPersonDoesNotExist](https://thispersondoesnotexist.com/), which generates new faces on each refresh. I wanted to make a model trained on a custom dataset, and chose the flower dataset [here](http://www.robots.ox.ac.uk/~vgg/data/flowers/102/index.html). I was able to preprocess the data and generate new flowers after training a StyleGAN specifically for this purpose over a few days. More details are in the [procedure](https://github.com/neilpg628/flower-images/blob/master/procedure.md) where I also describe using NVIDIA's existing models to generate everything from wild animals to renaissance paintings.

To replicate this you should first clone the stylegan2-ada repository [here](https://github.com/NVlabs/stylegan2-ada) and then follow the instructions in the procedure.
