--[[
temp vars reasons
posted_posted is used entirely to determine if the 3d text is displayed

on_job_delivery is used to work like a job check but on the un trustworthy client cuz I am ape

placed_posters is used to keep the count , if value doesnt exceed 9? then itl let you keep doing the job, else no no jobo for you o

PosterCoords redone to be less of a pain

constantly running thread removed because it was lame id rather just run a function if needed else fuck it

need to either solve the situation of stacking ass tons of posters on the same coord and them flikring OR add enough locations that its *very* un likely to roll the same location or do it the correct way and store it in a table/get closest entity of type and if present deleted

if to much of pain replace all instances of ```posterModeldefualt``` with the desired prop name 

will be swappiong some temp vars to statebags at some point.


***** 
I have made multiple attempts to reach out to him for permission to use it without response if hehas an issue with my use of it please contact me and I will take it down.

the animation itself was taken from a post made by PichotM https://forum.cfx.re/t/release-after-hours-poster-world-animation-scene/271076/1

3d text taken from Luke with permission https://github.com/LukeWasTakenn

I have left mythic notify alerts commented out up to you if you wana use them or not

-]]