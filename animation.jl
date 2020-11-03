# Fun side-project to familiarise myself with animating in Makie
# Started 03/11/2020

using Makie
using MakieLayout

#will want to add units to this after I have all this working
struct Squiggle
    amplitude::Float64
    period::Float64
    shift::Float64
end

scene, layout = layoutscene(resolution=(1400,700))

axis1=layout[1,1]=LAxis(scene,title="Squiggle")

#Slider for amplitude
amp_slider_layout=layout[2,1]=GridLayout(1,3)
amp_slider_layout[1,1]=LText(scene,"Amplitude")
amp_slider_layout[1,2]=amp_slider=LSlider(scene, range=0.2:0.2:10, startvalue=1.0)
amp_slider_layout[1,3]=LText(scene,lift(string, amp_slider.value))

x1=0:0.1:30

function makeWave(squiggle, x)
    y=sin.((2*3.14159/squiggle.period).*(x.-squiggle.shift)).*squiggle.amplitude
    return y
end

function Squiggle(amplitude=1.0, period=2.0*3.14159, shift=0.0)
    amplitude=amplitude
    period=period
    shift=shift
    return Squiggle(amplitude, period, shift)
end

function go(amplitude=1.0, period=2.0*3.14159, shift=0.0, x=0:0.1:30)
    rex=Squiggle(amplitude,period,shift)
    y1=makeWave(rex,x)
    return y1
end


P=plot!(axis1,x1,lift(go,amp_slider.value))

scene
