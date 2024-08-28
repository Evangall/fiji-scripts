# fiji-scripts
Fiji scripts used in Evan Gallagher's projects. The purpose of each script is to detect and quantify real staining in an immunofluorescence image in a quick and objective manner. 

Note that, as currently written, the ps129, AT8, GFAP, and Iba1 scripts will all be looking for GREEN staining, whereas the NT script will be looking for RED staining. The colocalization analyzer script will look for both red and green. 

Also note that all scripts require a 3-channel fluorescence microscopy image (red+green+blue) as an input. Thresholding values were established based on Evan's images; depending on exposure times and light source intensities, these values may need to be adjusted for your own images. 
