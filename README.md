# flower-images
Uses NVIDIA's StyleGAN2-ADA Network to generate images of flowers. 

The point of this project is to understand the architecture of the NVIDIA Labs network and how StyleGAN2 has been used to generate vast quantities of images of all kinds. The most famous example is probably the website [ThisPersonDoesNotExist](https://thispersondoesnotexist.com/), which generates new faces on each refresh. I wanted to make a model trained on a custom dataset, and chose the flower dataset [here](http://www.robots.ox.ac.uk/~vgg/data/flowers/102/index.html). I was able to preprocess the data and generate new flowers after training a StyleGAN2 network specifically for this purpose over a few days on a NVIDIA Titan RTX. More details are in the [procedure](https://github.com/neilpg628/flower-images/blob/master/procedure.md) where I also describe using NVIDIA's existing models to generate everything from wild animals to Renaissance paintings. Every image in this repository was generated by a computer. The final result was a model that I could use to generate any number of flower images. Some examples are shown below. All of them are generated.

To replicate this you should first clone the stylegan2-ada repository [here](https://github.com/NVlabs/stylegan2-ada) and then follow the instructions in the procedure. Refer to the GAN PDF for a background on Generative Adversarial Networks. Following the procedure can also produce interesting gifs where images smoothly move between eachother as the model traverses the image latent space. I was able to do this for the following objects

* [Cars](https://youtu.be/KRlBJYKeLgI)
* [Cats](https://youtu.be/g3ex_i6e1Sg)
* [Churches](https://youtu.be/X_Ds6MZbTPo)
* [Horses](https://youtu.be/jz84aYEAcyE)
* [People](https://youtu.be/6_srYUcTX6g)

![Generated Flowers](https://github.com/neilpg628/flower-images/blob/master/flowers/fakes003000.png)
