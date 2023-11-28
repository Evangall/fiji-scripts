selectImage(1);
rename("original")
run("Duplicate...", "title=dup duplicate");
run("Split Channels");
selectImage("C1-dup");
rename("Green");
selectImage("C2-dup");
rename("Blue")
selectImage("C3-dup");
rename("Red");
close("Blue");
imageCalculator("Subtract create", "Green","Red");
selectWindow("Result of Green");
run("Subtract Background...", "rolling=50");
setThreshold(1350, 65535, "raw");
run("Create Selection");
roiManager("Add");
roiManager("Select", 0);
run("Measure");
close("Green");
close("Red");
close("Result of Green");
selectWindow("original");
rename("original with GFAP selected");
roiManager("Select", 0);
roiManager("Delete");
selectWindow("Results");