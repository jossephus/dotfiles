" 
let colorschemes = map(split(globpath(&rtp, "colors/*.vim"), "\n"), "split(substitute(v:val, '\.vim', '', 'g'), '\/')[-1]")
