# Fun side-project to familiarise myself with animating in Makie
# Started 03/11/2020

using Makie
using MakieLayout

scene, layout = layoutscene(resolution=(1400,700))

axis1=layout[1,1]=LAxis(scene,title="Squiggle")

#Slider for amplitude
amp_slider_layout=layout[2,1]=GridLayout(1,3)
amp_slider_layout[1,1]=LText(scene,"Amplitude")
amp_slider_layout[1,2]=amp_slider=LSlider(scene, range=0.2:0.2:10, startvalue=1.0)
amp_slider_layout[1,3]=LText(scene,lift(string, amp_slider.value))

x1=0:0.1:30
y1=sin.(x1)


function f(x)
    return y1.*x
end

P=plot!(axis1,x1,lift(f,amp_slider.value))

scene
