// This script will take an AT8+3NT/DHE+DAPI image and tell you the area covered by AT8, 3NT/DHE, and both AT8+3NT
// As an input, this script requires a 3-channel image where green is C1, blue is C2, and red is C3

//duplicate the original image and split the channels
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

//make the blue selection and expand it a bit
selectImage("Blue");
setAutoThreshold("Otsu dark");
run("Create Selection");
run("Enlarge...", "enlarge=10 pixel");
roiManager("Add");
roiManager("Select", 0);
roiManager("Rename", "BlueSelection");
close("Blue");

//make the green selection and (optionally) measure it
selectWindow("Green");
run("Subtract Background...", "rolling=50");
setThreshold(2000, 65535, "raw");
//used 1250 as min threshold for 3NT images (adjust based on your own staining)
run("Create Selection");
roiManager("Add");
roiManager("Select", 1);
roiManager("Rename", "GreenSelection");
//run("Measure");
close("Green");

//make the red selection and (optionally) measure it
selectWindow("Red");
run("Subtract Background...", "rolling=50");
setThreshold(500, 65535, "raw");
//used 1500 as min threshold for 3NT images (adjust based on your own staining)
run("Create Selection");
roiManager("Add");
roiManager("Select", 2);
roiManager("Rename", "RedSelection");
//run("Measure");
close ("Red");

//find and select the overlap between green and blue (AT8-positive cells), then measure it
roiManager("Select", newArray(0,1));
roiManager("AND");
roiManager("Add");
roiManager("Select", 3);
roiManager("Rename", "Green + Blue Overlap");
run("Measure");

//find and select the overlap between red and blue (3NT/DHE-positive cells)
roiManager("Select", newArray(0,2));
roiManager("AND");
roiManager("Add");
roiManager("Select", 4);
roiManager("Rename", "Red + Blue Overlap");

//find the overlap between the AT8 positive cells and the 3NT/DHE positive cells and measure it
roiManager("Select", newArray(3,4));
roiManager("AND");
roiManager("Add");
roiManager("Select", 5);
roiManager("Rename", "Green + Red + Blue overlap");
run("Measure");

//switch back to the original image and display the overlap on it
selectWindow("original");
rename("original with overlap selected");
roiManager("Select", 5);
selectWindow("Results");


// In the results window...
// the first area is the area covered by both blue and green (AT8-positive cells)
// the second area is the area covered by green, blue, and red (AT8 and 3NT/DHE positive cells)
// By dividing the second area by the first, we get the percentage of cellular AT8 staining that is also positive for 3NT/DHE
// "Of the AT8 signal found in the cytoplasm, what percentage colocalized with 3NT/DHE?"
