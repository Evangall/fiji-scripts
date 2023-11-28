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
selectImage("Blue");
setAutoThreshold("Huang dark");
run("Create Selection");
run("Enlarge...", "enlarge=10 pixel");
roiManager("Add");
imageCalculator("Subtract create", "Red","Green");
selectWindow("Red");
roiManager("Select", 0);
run("Subtract Background...", "rolling=50");
run("Measure");
close("Blue");
close("Green");
close("Red");
close("Result of Red");
selectWindow("original");
rename("original with NT measurement area selected - note only red channel is measured");
roiManager("Select", 0);
roiManager("Delete");
selectWindow("Results");