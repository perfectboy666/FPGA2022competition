onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+clock_manage -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.clock_manage xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {clock_manage.udo}

run -all

endsim

quit -force
