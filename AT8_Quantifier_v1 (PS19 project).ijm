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
close("Red");
selectWindow("Green");
run("Subtract Background...", "rolling=50");
setThreshold(1250, 65535, "raw");
run("Create Selection");
roiManager("Add");
roiManager("Select", 0);
run("Measure");
close("Green");
selectWindow("original");
rename("original with AT8 selected");
roiManager("Select", 0);
roiManager("Delete");
selectWindow("Results");