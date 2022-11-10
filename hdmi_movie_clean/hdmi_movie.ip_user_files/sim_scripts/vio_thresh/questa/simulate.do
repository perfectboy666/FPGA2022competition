onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib vio_thresh_opt

do {wave.do}

view wave
view structure
view signals

do {vio_thresh.udo}

run -all

quit -force
